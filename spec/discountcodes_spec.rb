require_relative '../lib/discountcodes.rb'

describe 'DiscountCodes' do

  let(:stock) { double(:stock) }
  let(:shoppingcartwithfootwear) { [double(:shoppingcartwithfootwear)] }
  let(:shoppingcartwithoutfootwear) { [double(:shoppingcartwithoutfootwear)] }

  before(:each) do
    @discountcodes = DiscountCodes.new
  end

  context 'discount check' do
    it 'should return 5 if the code is correct' do
      expect(@discountcodes.discount_check('5poundsoff', 100, shoppingcartwithfootwear)).to eq 5
    end

    it 'should return 0 if the code is incorrect' do
      expect(@discountcodes.discount_check('wrong code', 100, shoppingcartwithfootwear)).to eq 0
    end

    it 'should return 5 if the code is correct and shoppingcarttotal > 50' do
      expect(@discountcodes.discount_check('10poundsoff', 100, shoppingcartwithfootwear)).to eq 10
    end

    it 'should return 0 if the code is incorrect' do
      expect(@discountcodes.discount_check('wrong code', 100, shoppingcartwithfootwear)).to eq 0
    end

    it 'should return 0 if shoppingcarttotal < 50' do
      expect(@discountcodes.discount_check('10poundsoff', 1, shoppingcartwithfootwear)).to eq 0
    end

    it 'should return 15 if the code is correct and shoppingcarttotal > 75' do
      allow(stock).to receive(:check_category).and_return(true)
      expect(@discountcodes.discount_check('15poundsoff', 76, shoppingcartwithfootwear, stock)).to eq 15
    end

    it 'should return 0 if the code is incorrect' do
      allow(stock).to receive(:check_category).and_return(true)
      expect(@discountcodes.discount_check('wrong code', 100, shoppingcartwithfootwear, stock)).to eq 0
    end

    it 'should return 0 if shoppingcarttotal < 75' do
      allow(stock).to receive(:check_category).and_return(true)
      expect(@discountcodes.discount_check('15poundsoff', 49, shoppingcartwithfootwear, stock)).to eq 0
    end

    it 'should return 0 if shoppingcart does not contain a footwear item' do
      allow(stock).to receive(:check_category).and_return(false)
      expect(@discountcodes.discount_check('15poundsoff', 100, shoppingcartwithoutfootwear, stock)).to eq 0
    end

    it 'should return 15 if shoppingcart only contains mens footwear item' do
      allow(stock).to receive(:check_category).and_return(true, false)
      expect(@discountcodes.discount_check('15poundsoff', 100, shoppingcartwithoutfootwear, stock)).to eq 15
    end

    it 'should return 15 if shoppingcart only contains womens footwear item' do
      allow(stock).to receive(:check_category).and_return(false, true)
      expect(@discountcodes.discount_check('15poundsoff', 100, shoppingcartwithoutfootwear, stock)).to eq 15
    end
  end
end
