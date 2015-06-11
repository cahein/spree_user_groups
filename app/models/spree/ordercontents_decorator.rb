Spree::OrderContents.class_eval do
  def add(variant, quantity = 1, options = {})
    line_item = add_to_line_item(variant, quantity, options)
    after_add_or_remove(line_item, options)

    if user = Spree::User.current
      if user.user_group
        line_item.price = variant.price
        line_item.save
        @order.update!
      end
    end
  end
end
