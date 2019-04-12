require_relative './stock.rb'

class ShoppingCart

  attr_reader :shoppingcart, :stock

  def initialize(stock = Stock.new)
    @stock = stock
    @shoppingcart = []
  end

  def add_to_cart(item)
    @shoppingcart << item
  end
end
