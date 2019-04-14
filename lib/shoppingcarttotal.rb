require_relative './stock.rb'
require_relative './discountcodes.rb'

class ShoppingCartTotal

  attr_reader :price, :discount_price, :discountcodes

  def initialize(discount_codes = DiscountCodes.new)
    @price = '0.00'
    @discount_price = '0.00'
    @discountcodes = discount_codes
  end

  def total_price(code, shoppingcart, stock = Stock.new)
    @price = 0
    shoppingcart.each{ | item | @price += stock.check_price(item) }
    total_price_with_discount_check(code, @price, shoppingcart)
  end

  private

  def total_price_with_discount_check(code, shoppingcarttotal, shoppingcart)
    (@price == 0) ? set_no_discount : set_discount_price(code, shoppingcarttotal, shoppingcart)
  end

  def set_no_discount
    @discount_price = @price
  end

  def set_discount_price(code, shoppingcarttotal, shoppingcart)
    @discount_price = @price - @discountcodes.discount_check(code, shoppingcarttotal, shoppingcart)
  end
end
