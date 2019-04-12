require_relative './stock.rb'
require_relative './discountcodes.rb'

class ShoppingCartTotal

  attr_reader :price, :discount_price, :discountcodes

  def initialize(discount_codes = DiscountCodes.new)
    @price = 0
    @discount_price = 0
    @discountcodes = discount_codes
  end

  def total_price(code, shoppingcart, stock = Stock.new)
    @price = 0
    shoppingcart.each{ | item | @price += stock.check_price(item) }
    total_price_with_discount_check(code, @price, shoppingcart)
    @price = two_decimal_places(@price)
  end

  def total_price_with_discount_check(code, shoppingcarttotal, shoppingcart)
    if code == nil
      @discount_price = two_decimal_places(@price)
    else
      @discount_price = two_decimal_places(@price - @discountcodes.discount_check(code, shoppingcarttotal, shoppingcart))
    end
  end

  private

  def two_decimal_places(amount)
    '%.2f' % amount
  end
end
