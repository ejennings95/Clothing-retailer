require_relative './stock.rb'

class ShoppingCartTotal

  def initialize
    @price = 0
  end

  def total_price(shoppingcart, stock = Stock.new)
    @price = 0
    shoppingcart.each{ | item | @price += stock.check_price(item) }
    two_decimal_places(@price)
  end

  private

  def two_decimal_places(amount)
    '%.2f' % amount
  end
end
