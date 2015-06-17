Spree::Variant.class_eval do
  @original_price = nil

  def price_for_user(user)
    if user && user.user_group
      user.user_group.price_for_variant(self) || price
    else
      price
    end
  end

  def set_original_price(vlue)
    @original_price = vlue
  end

  def original_price
    @original_price
  end

  def price
    return 0 if new_record?
    # TODO: multiple prices and currencies not covered yet
    oprice = 0
    if prices.first && !prices.first.amount
      oprice = prices.first.amount.to_f
    elsif product && product.prices.any?
      oprice = product.prices.first.amount.to_f
    end

    if Spree::User.current and Spree::User.current.user_group then
      set_original_price oprice
      group_price
    else
      oprice
    end
  end

  def group_price
    Spree::User.current.user_group.price_for_variant(self) || prices.first.amount.to_f
  end
end
