
class DiscountCodes

  FIVE_OFF = '5poundsoff'
  TEN_OFF = '10poundsoff'
  FIFTEEN_OFF = '15poundsoff'

  def discount_check(code, shoppingcarttotal)
    return 5 if discount_five(code) == true
    return 10 if discount_ten(code, shoppingcarttotal) == true
    0
  end

  def discount_five(code)
    code == FIVE_OFF ? true : false
  end

  def discount_ten(code, shoppingcarttotal)
    (code == TEN_OFF && shoppingcarttotal > 50) ? true : false
  end
end
