require_relative '../lib/shoppingcart.rb'

describe 'ShoppingCart' do

  let(:stock) { double(:stock) }

  before(:each) do
    @testshoppingcart = ShoppingCart.new(stock)
  end

  context 'add_to_cart' do
    it 'should increase the cart quantity by 1' do
      expect { @testshoppingcart.add_to_cart("item") }.to change { @testshoppingcart.shoppingcart.length }.by 1
    end
  end
end
