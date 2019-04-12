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
end
