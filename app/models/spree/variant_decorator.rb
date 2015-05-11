Spree::Variant.class_eval do
  def price_for_user(user)
    if user && user.user_group
      user.user_group.price_for_variant(self) || price
    else
      price
    end
  end


  def price
    return 0 if new_record?

    oprice = 0
    if prices.first && !prices.first.amount
      oprice = prices.first.amount.to_f
    elsif product && product.prices.any?
      oprice = product.prices.first.amount.to_f
    end

    if Spree::User.current and Spree::User.current.user_group then
      group_price(oprice)
    end

  end

  def group_price(oprice)
    Spree::User.current.user_group.price_for_variant(self, oprice) || prices.first.amount.to_f
  end
end
