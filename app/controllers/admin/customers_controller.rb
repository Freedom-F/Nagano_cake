class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
    @status   = Customer.select("is_deleted").find_by(id: params[:id]) 
  end

  def edit
  end

  def update
  end
end
