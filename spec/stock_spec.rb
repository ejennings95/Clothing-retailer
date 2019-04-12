require_relative '../lib/stock.rb'

describe 'Stock' do

  before(:each) do
    @stock = Stock.new
  end

  context 'check price' do
    it 'should return the correct price of the item' do
      expect(@stock.check_price('Leather Driver Saddle Loafers, Tan')).to eq 34.00
    end

    it 'should return the correct price of the item' do
      expect(@stock.check_price('Lightweight Patch Pocket Blazer, Deer')).to eq 175.00
    end

    it 'should return 0 if there is no item match' do
      expect(@stock.check_price('Denim Jacket')).to eq 0
    end
  end

  context 'check category' do
    it 'should return true if the category matches' do
      expect(@stock.check_category('Leather Driver Saddle Loafers, Tan', "Men's Footwear")).to eq true
    end
    it 'should return false if the category does not matches' do
      expect(@stock.check_category('Leather Driver Saddle Loafers, Tan', "Women's Footwear")).to eq false
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

end
