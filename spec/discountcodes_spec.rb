require_relative '../lib/discountcodes.rb'

describe 'DiscountCodes' do

  before(:each) do
    @discountcodes = DiscountCodes.new
  end

  context '5 pounds off' do
    it 'should return 5 if the code is correct' do
      expect(@discountcodes.discount_five('5poundsoff')).to eq true
    end

    it 'should return 0 if the code is incorrect' do
      expect(@discountcodes.discount_five('wrong code')).to eq false
    end
  end

  context 'discount check' do
    it 'should return 5 if the code is correct' do
      expect(@discountcodes.discount_check('5poundsoff')).to eq 5
    end

    it 'should return 0 if the code is incorrect' do
      expect(@discountcodes.discount_check('wrong code')).to eq 0
    end
  end
end
