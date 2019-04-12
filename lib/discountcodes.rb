
class DiscountCodes

  FIVE_OFF = '5poundsoff'
  TEN_OFF = '10poundsoff'
  FIFTEEN_OFF = '15poundsoff'

  attr_reader :discount_attempted

  def discount_check(code, shoppingcarttotal, shoppingcart)
    return 5 if discount_five(code) == true
    return 10 if discount_ten(code, shoppingcarttotal) == true
    return 15 if discount_fifteen(code, shoppingcarttotal, shoppingcart) == true
    0
  end

  def code_check(code)
    return true if code == FIVE_OFF || code == TEN_OFF || code == FIFTEEN_OFF
    false
  end

  def discount_five(code)
    code == FIVE_OFF ? true : false
  end

  def discount_ten(code, shoppingcarttotal)
    (code == TEN_OFF && shoppingcarttotal > 50) ? true : false
  end

  def discount_fifteen(code, shoppingcarttotal, shoppingcart, stock = Stock.new)
    (code == FIFTEEN_OFF && shoppingcarttotal > 75 && footwearitem?(shoppingcart, stock)) ? true : false
  end

  private

  def footwearitem?(shoppingcart, stock)
    shoppingcart.each{ | item | return true if stock.check_category(item, "Men's Footwear") }
    shoppingcart.each{ | item | return true if stock.check_category(item, "Women's Footwear")}
    false
  end

end
