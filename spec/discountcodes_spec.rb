require_relative '../lib/discountcodes.rb'

describe 'DiscountCodes' do

  let(:stock) { double(:stock) }
  let(:shoppingcartwithfootwear) { [double(:shoppingcartwithfootwear)] }
  let(:shoppingcartwithoutfootwear) { [double(:shoppingcartwithoutfootwear)] }

  before(:each) do
    @discountcodes = DiscountCodes.new
  end

  context '5 pounds off' do
    it 'should return true if the code is correct' do
      expect(@discountcodes.discount_five('5poundsoff')).to eq true
    end

    it 'should return false if the code is incorrect' do
      expect(@discountcodes.discount_five('wrong code')).to eq false
    end
  end

  context '10 pounds off' do
    it 'should return true if the code is correct and shoppingcarttotal > 50' do
      expect(@discountcodes.discount_ten('10poundsoff', 51)).to eq true
    end

    it 'should return false if the code is incorrect' do
      expect(@discountcodes.discount_ten('wrong code', 100)).to eq false
    end

    it 'should return false if shoppingcarttotal < 50' do
      expect(@discountcodes.discount_ten('10poundsoff', 49)).to eq false
    end
  end

  context '15 pounds off' do
    it 'should return true if the code is correct and shoppingcarttotal > 75' do
      allow(stock).to receive(:check_category).and_return(true)
      expect(@discountcodes.discount_fifteen('15poundsoff', 76, shoppingcartwithfootwear, stock)).to eq true
    end

    it 'should return false if the code is incorrect' do
      allow(stock).to receive(:check_category).and_return(true)
      expect(@discountcodes.discount_fifteen('wrong code', 100, shoppingcartwithfootwear, stock)).to eq false
    end

    it 'should return false if shoppingcarttotal < 75' do
      allow(stock).to receive(:check_category).and_return(true)
      expect(@discountcodes.discount_fifteen('15poundsoff', 49, shoppingcartwithfootwear, stock)).to eq false
    end

    it 'should return false if shoppingcart does not contain a footwear item' do
      allow(stock).to receive(:check_category).and_return(false)
      expect(@discountcodes.discount_fifteen('15poundsoff', 100, shoppingcartwithoutfootwear, stock)).to eq false
    end
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
  end
end
