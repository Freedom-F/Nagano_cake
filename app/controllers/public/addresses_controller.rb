class Public::AddressesController < ApplicationController
  def index
    @addresses = current_customer
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
end
