require_relative '../lib/shoppingcart.rb'

describe 'ShoppingCart' do

  let(:stock) { double(:stock) }
  let(:shoppingcarttotal) { double(:shoppingcarttotal) }

  before(:each) do
    @testshoppingcart = ShoppingCart.new(stock, shoppingcarttotal)
    allow(stock).to receive(:in_stock?).and_return(true)
    allow(stock).to receive(:reduce_stock_by_1)
    allow(stock).to receive(:increase_stock_by_1)
  end

  context 'add_to_cart' do
    it 'should increase the cart quantity by 1' do
      allow(stock).to receive(:find_item_quantity_1).and_return("item")
      allow(shoppingcarttotal).to receive(:total_price)
      expect { @testshoppingcart.add_to_cart("item") }.to change { @testshoppingcart.shoppingcart.length }.by 1
    end
  end

  context 'remove_from_cart' do
    it 'should decrease the cart quantity by 1' do
      allow(stock).to receive(:find_item_quantity_1).and_return("item")
      allow(shoppingcarttotal).to receive(:total_price)
      expect { @testshoppingcart.add_to_cart("item") }.to change { @testshoppingcart.shoppingcart.length }.by 1
    end

    it 'should remove the correct item from the cart' do
      allow(stock).to receive(:find_item_quantity_1).and_return("item", "item2")
      allow(shoppingcarttotal).to receive(:total_price)
      @testshoppingcart.add_to_cart("item")
      @testshoppingcart.add_to_cart("item2")
      @testshoppingcart.remove_from_cart("item2")
      expect(@testshoppingcart.shoppingcart).to include("item")
      expect(@testshoppingcart.shoppingcart).not_to include("item2")
    end

    it 'should remove the item only once if added twice' do
      allow(stock).to receive(:find_item_quantity_1).and_return("item", "item")
      allow(shoppingcarttotal).to receive(:total_price)
      @testshoppingcart.add_to_cart("item")
      @testshoppingcart.add_to_cart("item")
      @testshoppingcart.remove_from_cart("item")
      expect(@testshoppingcart.shoppingcart).to contain_exactly("item")
    end
  end

  context 'total price returned from shoppingcarttotal' do
    it 'should pass the cart to the shoppingcarttotal and have a number returned in string format' do
      allow(stock).to receive(:find_item_quantity_1).and_return("item")
      allow(shoppingcarttotal).to receive(:total_price).and_return('10.00')
      @testshoppingcart.add_to_cart("item")
      expect(@testshoppingcart.total(shoppingcarttotal)).to eq '10.00'
    end
  end
end
