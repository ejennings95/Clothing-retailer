
class ShoppingCart

  attr_reader :shoppingcart

  def initialize
    @shoppingcart = []
  end

  def add_to_cart(item)
    @shoppingcart << item
  end
end
