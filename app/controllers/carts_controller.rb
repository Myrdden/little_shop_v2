class CartsController < ApplicationController
  def create
    id = params[:item_id]
    @cart = Cart.new(session[:cart])
    if params[:quantity].class != String
      quantity = params[:quantity].keys
      quantity = quantity[0].to_i
    else
      if params[:adding] == "1"
        quantity = params[:quantity].to_i + @cart.quantity_of(id)
      else
        quantity = params[:quantity].to_i
      end
    end
    @cart.add(id, quantity)
    session[:cart] = @cart.contents
    #flash for
    redirect_back fallback_location: '/'
  end

  def update
    coupon = Coupon.find_by code: params[:code]
    if coupon
      session[:coupon_id] = coupon.id
      flash[:note] = "Coupon added."
    else
      flash[:warn] = "No coupon with that code found."
    end
    redirect_to cart_path
  end

  def show
    if current_user && (current_user.merchant? || current_admin?)
      render file: "/public/404", status: 404
    end
    @cart = Cart.new(session[:cart])
    if session[:coupon_id]
      @coupon = Coupon.find(session[:coupon_id])
    else
      @coupon = nil
    end
  end

  def destroy; session[:cart] = nil; redirect_to '/cart' end
end
