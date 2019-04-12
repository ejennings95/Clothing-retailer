require 'sinatra/base'
require 'sinatra/flash'
require_relative '../lib/shoppingcart.rb'

class ClothingRetailer < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    session[:shoppingcart] ||= ShoppingCart.new
    @shoppingcart = session[:shoppingcart]
    flash[:warning] = "Discount Voucher has not been successful - try again!"
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

  post '/discount_code' do
    session[:shoppingcart].total(params[:discount_code])
    redirect '/'
  end

    run! if app_file == $0
end
