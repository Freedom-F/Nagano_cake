class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
    @status   = Customer.select("is_deleted").find_by(id: params[:id]) 
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    
    customer.update(customer_params)
    redirect_to admin_customer_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :last_name, :last_name_kana, :first_name_kana, :post_code, 
      :address, :phone_number, :email, :is_deleted)
  end
end
