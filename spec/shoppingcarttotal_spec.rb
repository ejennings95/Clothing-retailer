require_relative '../lib/shoppingcarttotal.rb'

describe 'ShoppingCartTotal' do

  let(:stock) { double(:stock) }
  let(:shoppingcart) { double(:testshoppingcart) }
  let(:discountcodes) { double(:discountcodes) }
  let(:flipFlopsRed) { [{name: "Flip Flops, Red", category: "Men's Footwear", price: 19.00, quantity: 6}] }
  let(:denimjacket) { [{name: "Denim Jacket", category: "Men's Casualwear", price: 150.00, quantity: 11}] }


  before(:each) do
    @shoppingcarttotal = ShoppingCartTotal.new
  end

  context 'calculate price' do
    it 'should return the price of the item' do
      allow(stock).to receive(:check_price).and_return(19.0)
      expect(@shoppingcarttotal.total_price(nil, flipFlopsRed)).to eq 19.0
    end

    it 'should return 0 if the item does not exist' do
      allow(stock).to receive(:check_price).and_return(19.0)
      expect(@shoppingcarttotal.total_price(nil, denimjacket)).to eq 0.0
    end
  end

  context 'calculate discount price' do
    it 'should not be possible to add a discount to 0' do
      allow(stock).to receive(:check_price).and_return(0)
      @shoppingcarttotal.total_price("5poundsoff", [])
      expect(@shoppingcarttotal.discount_price).to eq 0.0
    end

    it 'should return the discount price of the item' do
      allow(stock).to receive(:check_price).and_return(19.0)
      allow(discountcodes).to receive(:discount_check).and_return(5)
      @shoppingcarttotal.total_price("5poundsoff", flipFlopsRed)
      expect(@shoppingcarttotal.discount_price).to eq 14.0
    end
  end
end
