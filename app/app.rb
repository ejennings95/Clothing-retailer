require 'sinatra/base'
require 'sinatra/flash'
require_relative '../lib/shoppingcart.rb'
require_relative '../lib/format_price.rb'

class ClothingRetailer < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    session[:shoppingcart] ||= ShoppingCart.new
    @shoppingcart = session[:shoppingcart]
    @code_check = session[:code_check]
    flash[:warning] = "Invaild discount code entered - try again!"
    @format = FormatPrice.new
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
    session[:code_check] = session[:shoppingcart].shoppingcarttotal.discountcodes.code_check(params[:discount_code])
    redirect '/'
  end

    run! if app_file == $0
end
