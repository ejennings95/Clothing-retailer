require_relative './stock.rb'
require_relative './shoppingcarttotal.rb'

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

  def total(shoppingcarttotal = ShoppingCartTotal.new)
    shoppingcarttotal.total_price(@shoppingcart)
  end
end
