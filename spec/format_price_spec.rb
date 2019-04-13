require_relative '../lib/format_price.rb'

describe 'FormatPrice' do

  before(:each) do
    @format = FormatPrice.new
  end

  context 'manipulate numbers into pouund format' do
    it 'should format 0 into 0.00' do
      expect(@format.two_decimal_places(0)).to eq '0.00'
    end

    it 'should format 9.0 into 9.00' do
      expect(@format.two_decimal_places(9.0)).to eq '9.00'
    end
  end
end
