Spree::Product.class_eval do
  def price_for_user(user)
    self.master.price_for_user(user)
  end

  @original_price = nil
  def set_original_variant_price(vlue)
    @original_price = vlue
  end

  def original_variant_price
    @original_price
  end

end
