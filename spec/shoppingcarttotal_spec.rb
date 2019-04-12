require_relative '../lib/shoppingcarttotal.rb'

describe 'ShoppingCartTotal' do

  let(:stock) { double(:stock) }
  let(:shoppingcart) { double(:testshoppingcart) }
  let(:flipFlopsRed) { ["Flip Flops, Red"] }

  before(:each) do
    @shoppingcarttotal = ShoppingCartTotal.new
  end

  context 'calculate price' do
    it 'should return the price of the item' do
      allow(stock).to receive(:check_price).and_return(19.0)
      expect(@shoppingcarttotal.total_price(flipFlopsRed)).to eq '19.00'
    end

    it 'should return 0 if the item does not exist' do
      allow(stock).to receive(:check_price).and_return(19.0)
      expect(@shoppingcarttotal.total_price(["Denim Jacket"])).to eq '0.00'
    end
  end
end
