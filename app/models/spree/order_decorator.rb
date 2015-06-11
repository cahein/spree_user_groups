Spree::Order.class_eval do
  alias_method :omerge!, :merge!
  def merge!(order, user = nil)
    # if the user belongs to a user_group, the variant price may be different
    if user && user.user_group
      if self.line_items.any?
        self.line_items.each do |original_line_item|
          original_price = original_line_item.price
          variant = Spree::Variant.find original_line_item.variant_id
          if variant.price < original_price
            original_line_item.price = variant.price
            original_line_item.save!
          end
        end
      end
    end
    omerge! order, user
  end
end
