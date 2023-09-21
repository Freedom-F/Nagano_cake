class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.where(customer_id: current_customer.id)
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
      address = Address.new(address_params)
      address.customer_id = current_customer.id
    if address.save
      redirect_to public_addresses_index_path
    else
      @addresses = Address.where(customer_id: current_customer.id)
      @address = Address.new 
      render :index
    end
  end

  def update
       address = Address.find(params[:id])
    if address.update(address_params)
       redirect_to public_addresses_index_path
    else
      @address = Address.find(params[:id])
      render :edit
    end
  end

  def destroy
       address = Address.find(params[:id])
       address.destroy
  end

  private

  def address_params
    params.require(:address).permit(:name, :address, :post_code)
  end
end
