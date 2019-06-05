class CouponsController < ApplicationController
  def new
    @coupon = Coupon.new    
  end

  def create
    coupon = current_user.coupons.new(coupon_params)
    if coupon.save
      flash[:note] = "Coupon Added."
      redirect_to dashboard_path
    else
      flash[:warn] = "Invalid input."
      redirect_to new_coupon_path
    end
  end

  def edit
    @coupon = Coupon.find(params[:id])
  end

  def update
    if Coupon.find(params[:id]).update(coupon_params)
      flash[:note] = "Coupon updated."
      redirect_to dashboard_path
    else
      flash[:warn] = "Invalid input."
      redirect_to edit_coupon_path
    end
  end

  def destroy
    Coupon.destroy(params[:id])
    flash[:note] = "Coupon has been deleted."
    redirect_to dashboard_path
  end

  def disable
    Coupon.find(params[:id]).update(active: false)
    flash[:note] = "Coupon has been disabled."
    redirect_to dashboard_path
  end

  private

  def coupon_params
    params.require(:coupon).permit(:name, :code, :amount, :percent)
  end
end
