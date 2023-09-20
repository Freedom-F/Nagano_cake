class Public::AddressesController < ApplicationController
  def index
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def address_params
    params.require(:address).permit(:customer_id,:name,:address,:post_code)
  end
end
