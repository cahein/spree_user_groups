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
    if prices.first && !prices.first.amount
      set_original_price prices.first.amount.to_f
    elsif product && product.prices.any?
      self.set_original_price product.prices.first.amount.to_f
    end

    if Spree::User.current and Spree::User.current.user_group then
      group_price
    else
      self.original_price
    end

  end

  def group_price
    Spree::User.current.user_group.price_for_variant(self) || prices.first.amount.to_f
  end
end
