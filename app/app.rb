require 'sinatra/base'
require_relative '../lib/shoppingcart.rb'

class ClothingRetailer < Sinatra::Base

  get '/' do
    @shoppingcart = ShoppingCart.new
    erb(:index)
  end

    run! if app_file == $0
end
