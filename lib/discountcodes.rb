
class DiscountCodes

  FIVE_OFF = '5poundsoff'
  TEN_OFF = '10poundsoff'
  FIFTEEN_OFF = '15poundsoff'

  def discount_check(code)
    return 5 if discount_five(code) == true
    0
  end

  def discount_five(code)
    code == FIVE_OFF ? true : false
  end
end
