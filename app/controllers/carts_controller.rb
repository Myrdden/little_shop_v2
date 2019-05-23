class CartsController < ApplicationController
  def create
    id = params[:item_id].keys[0].to_i #Fix for the weird form behaviour
    @cart = Cart.new(session[:cart])
    @cart.add(id, params[:quantity])
    session[:cart] = @cart.contents
    #flash for
    redirect_to item_path(id)
  end

  def show
    @cart = Cart.new(session[:cart])
  end

  def destroy; session[:cart] = nil; redirect_to '/cart' end
end
