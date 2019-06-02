class AddressesController < ApplicationController
  def new
    @address = Address.new    
  end

  def create
    if current_user.addresses.create(address_params)
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
      flash[:warn] = "Input invalid."
      redirect_to edit_address_path
    end
  end

  def destroy
    Address.destroy(params[:id])
    flash[:note] = "Address has been deleted."
    redirect_to profile_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :address, :city, :state, :zip)
  end
end
