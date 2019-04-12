require_relative '../lib/shoppingcart.rb'

describe 'ShoppingCart' do

  let(:stock) { double(:stock) }
  let(:shoppingcarttotal) { double(:shoppingcarttotal) }

  before(:each) do
    @testshoppingcart = ShoppingCart.new(stock)
  end

  context 'add_to_cart' do
    it 'should increase the cart quantity by 1' do
      expect { @testshoppingcart.add_to_cart("item") }.to change { @testshoppingcart.shoppingcart.length }.by 1
    end
  end

  context 'remove_from_cart' do
    it 'should decrease the cart quantity by 1' do
      expect { @testshoppingcart.add_to_cart("item") }.to change { @testshoppingcart.shoppingcart.length }.by 1
    end

    it 'should remove the correct item from the cart' do
      @testshoppingcart.add_to_cart("item")
      @testshoppingcart.add_to_cart("item2")
      @testshoppingcart.remove_from_cart("item2")
      expect(@testshoppingcart.shoppingcart).to include("item")
      expect(@testshoppingcart.shoppingcart).not_to include("item2")
    end
  end

  context 'total price returned from shoppingcarttotal' do
    it 'should pass the cart to the shoppingcarttotal and have a number returned in string format' do
      @testshoppingcart.add_to_cart("item")
      allow(shoppingcarttotal).to receive(:total_price).and_return('10.00')
      expect(@testshoppingcart.total(shoppingcarttotal)).to eq '10.00'
    end
  end
end
