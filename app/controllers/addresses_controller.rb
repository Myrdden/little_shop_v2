class AddressesController < ApplicationController
  def new
    @address = Address.new    
  end

  def create
    address = current_user.addresses.new(address_params)
    if address.save
      flash[:note] = "Address Added."
      redirect_to profile_path
    else
      flash[:warn] = "Invalid input."
      redirect_to new_address_path
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    if Address.find(params[:id]).update(address_params)
      flash[:note] = "Address updated."
      redirect_to profile_path
    else
      flash[:warn] = "Invalid input."
      redirect_to edit_address_path
    end
  end

  def destroy
    Address.destroy(params[:id])
    flash[:note] = "Address has been deleted."
    redirect_to profile_path
  end

  def disable
    Address.find(params[:id]).update(active: false)
    flash[:note] = "Address has been disabled."
    redirect_to profile_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :address, :city, :state, :zip)
  end
end
