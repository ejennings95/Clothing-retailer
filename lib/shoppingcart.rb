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

  def remove_from_cart(item)
    if @shoppingcart.include?(item)
      @shoppingcart.delete(item)
    end
  end
end
