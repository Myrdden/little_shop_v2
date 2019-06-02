class Profile::OrdersController < ApplicationController
  def index
  end

  def create
    order = Order.new user_id: current_user.id, status: 0, address_id: Address.find_by(name: params[:address_name]).id
    order.save
    @cart = Cart.new(session[:cart])
    items = @cart.items
    items.each do |item, quantity|
      order_item = OrderItem.new item_id: item.id, order_id: order.id,
        quantity: quantity, price: (item.price * quantity)
      order_item.save
    end
    session[:cart] = nil

    flash[:success] = "Order has been placed."
    redirect_to profile_orders_path
  end

  def show
    @order = Order.find(params[:id])
    @items_left = []; @items_mid = []; @items_right = []
    i = 0
    @order.items.each do |item|
      case i
      when 0; @items_left << item
      when 1; @items_mid << item
      when 2; @items_right << item
      end
      i += 1; i = 0 if i > 2
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.update(status: 3)
    @order.cancel_items
    flash[:message] = "Order #{@order.id} cancelled."
    redirect_to(profile_path)
  end

  def update
    Order.find(params[:id]).update(address_id: Address.find_by(name: params[:address_name]).id)
    redirect_to profile_order_path(params[:id])
  end
end
