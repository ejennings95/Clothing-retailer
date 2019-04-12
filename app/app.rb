require 'sinatra/base'
require_relative '../lib/shoppingcart.rb'

class ClothingRetailer < Sinatra::Base
  enable :sessions

  get '/' do
    session[:shoppingcart] ||= ShoppingCart.new
    @shoppingcart = session[:shoppingcart]
    erb(:index)
  end

  post '/add_to_cart' do
    session[:shoppingcart].add_to_cart(params[:item_name])
    redirect '/'
  end

  post '/remove_from_cart' do
    session[:shoppingcart].remove_from_cart(params[:item_name])
    redirect '/'
  end

    run! if app_file == $0
end
