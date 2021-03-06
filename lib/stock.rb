
class Stock

  def initialize(stock = [{name: "Leather Driver Saddle Loafers, Tan", category: "Men's Footwear", price: 34.00, quantity: 12}, {name: "Flip Flops, Red", category: "Men's Footwear", price: 19.00, quantity: 6}, {name: "Flip Flops, Blue", category: "Men's Footwear", price: 19.00, quantity: 0}, {name: "Almond Toe Court Shoes, Patent Black", category: "Women's Footwear", price: 99.00, quantity: 5}, {name: "Suede Shoes, Blue", category: "Women's Footwear", price: 42.00, quantity: 4}, {name: "Fine Stripe Short Sleeve Shirt, Grey", category: "Men's Casualwear", price: 49.99, quantity: 9}, {name: "Fine Stripe Short Sleeve Shirt, Green", category: "Men's Casualwear", price: 39.99, quantity: 3}, {name: "Gold Button Cardigan, Black", category: "Women's Casualwear", price: 167.00, quantity: 6}, {name: "Cotton Shorts, Medium Red", category: "Women's Casualwear", price: 30.00, quantity: 5}, {name: "Sharkskin Waistcoat, Charcoal", category: "Men's Formalwear", price: 75.00, quantity: 2}, {name: "Lightweight Patch Pocket Blazer, Deer", category: "Men's Formalwear", price: 175.00, quantity: 1}, {name: "Bird Print Dress, Black", category: "Women's Formalwear", price: 270.00, quantity: 10}, {name: "Mid Twist Cut­Out Dress, Pink", category: "Women's Formalwear", price: 540.00, quantity: 5}])
    @stock = stock
  end

  def stock_list
    @stock
  end

  def in_stock?(item)
    @stock.each{ | product | return true if product[:name] == item && product[:quantity] > 0 }
    false
  end

  def find_item_quantity_1(item)
    @stock.each{ | product |
      return {name: product[:name], category: product[:category], price: product[:price], quantity: 1} if product[:name] == item }
  end

  def check_price(item)
    @stock.each{ | product | return product[:price] if product[:name] == item[:name] }
    0
  end

  def check_category(item, category)
    @stock.each{ | product | return true if product[:name] == item[:name] && product[:category] == category}
    false
  end

  def reduce_stock_by_1(item)
    @stock.each{ | product | product[:quantity] -= 1 if product[:name] == item }
  end

  def increase_stock_by_1(item)
    @stock.each{ | product | product[:quantity] += 1 if product[:name] == item }
  end
end
