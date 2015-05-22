Spree::User.class_eval do
  belongs_to :user_group

  def after_database_authentication
    if self.user_group
      if self.user_group.calculator.is_a?(Spree::Calculator::AdvancedFlatPercent)
        current_order = Spree::Order.incomplete.order('id DESC').where({currency: 'EUR', user_id: self.id}).first
        current_line_items = current_order.line_items
        current_line_items.each do |line_item|
          variant = Spree::Variant.find line_item.variant_id
          calculated_price = self.user_group.calculator.compute_item(variant, variant.price)
          line_item.price = calculated_price
          line_item.save
        end
        current_order.update!
      end
    end
  end

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end
end
