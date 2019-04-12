require_relative '../lib/stock.rb'

describe 'Stock' do

  before(:each) do
    @stock = Stock.new
  end

  context 'check price' do
    it 'should return the correct price of the item' do
      expect(@stock.check_price({name: "Leather Driver Saddle Loafers, Tan", category: "Men's Footwear", price: 34.00, quantity: 12})).to eq 34.00
    end

    it 'should return the correct price of the item' do
      expect(@stock.check_price({name: "Lightweight Patch Pocket Blazer, Deer", category: "Men's Formalwear", price: 175.00, quantity: 1})).to eq 175.00
    end

    it 'should return 0 if there is no item match' do
      expect(@stock.check_price({name: "Denim Jacket", category: "Men's Formalwear", price: 150.00, quantity: 1})).to eq 0
    end
  end

  context 'check category' do
    it 'should return true if the category matches' do
      expect(@stock.check_category({name: "Leather Driver Saddle Loafers, Tan", category: "Men's Footwear", price: 34.00, quantity: 12}, "Men's Footwear")).to eq true
    end
    it 'should return false if the category does not matches' do
      expect(@stock.check_category({name: "Leather Driver Saddle Loafers, Tan", category: "Men's Footwear", price: 34.00, quantity: 12}, "Women's Footwear")).to eq false
    end
  end

  context 'check if in stock' do
    it 'should return true if the item is in stock matches' do
      expect(@stock.in_stock?('Leather Driver Saddle Loafers, Tan')).to eq true
    end

    it 'should return false if the item is not in stock matches' do
      expect(@stock.in_stock?('Flip Flops, Blue')).to eq false
    end
  end

  context 'increase and decrease stock' do
    it 'should increase stock by 1' do
      expect { @stock.increase_stock_by_1('Flip Flops, Red') }.to change { @stock.stock_list[1][:quantity] }.by 1
    end

    it 'should return false if the item is not in stock matches' do
      expect { @stock.reduce_stock_by_1('Flip Flops, Red') }.to change { @stock.stock_list[1][:quantity] }.by -1
    end
  end

  context 'return item with quantity one' do
    it 'should return the values of the item but with the quanity 1' do
        expect(@stock.find_item_quantity_1('Fine Stripe Short Sleeve Shirt, Green')).to eq({name: "Fine Stripe Short Sleeve Shirt, Green", category: "Men's Casualwear", price: 39.99, quantity: 1})
    end

    it 'should return the values of the item but with the quanity 1' do
      expect(@stock.find_item_quantity_1('Bird Print Dress, Black')).to eq({name: "Bird Print Dress, Black", category: "Women's Formalwear", price: 270.00, quantity: 1})
    end
  end
end
