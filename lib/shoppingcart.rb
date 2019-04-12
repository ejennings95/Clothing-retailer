require_relative './stock.rb'
require_relative './shoppingcarttotal.rb'
require_relative './discountcodes.rb'

class ShoppingCart

  attr_reader :shoppingcart, :stock, :shoppingcarttotal

  def initialize(stock = Stock.new, shoppingcarttotal = ShoppingCartTotal.new)
    @stock = stock
    @shoppingcart = []
    @shoppingcarttotal = shoppingcarttotal
  end

  def add_to_cart(item)
    if @stock.in_stock?(item)
      @stock.reduce_stock_by_1(item)
      @shoppingcart << item
    end
    total()
  end

  def remove_from_cart(item)
    if @shoppingcart.include?(item)
      @stock.increase_stock_by_1(item)
      @shoppingcart.delete(item)
    end
    total()
  end

  def total(code = nil)
    @shoppingcarttotal.total_price(code, @shoppingcart)
  end
end
