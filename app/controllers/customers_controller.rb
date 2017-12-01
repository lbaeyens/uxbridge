class CustomersController < ApplicationController
  before_action :require_login

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:success] = 'customer has been created.'
      redirect_to customers_path
    else
      flash.now[:danger] = 'customer has not been created.'
      render :new
    end

  end

  private
  def customer_params
    params.require(:customer).permit(:lastname, :name, :address, :postalcode_id, :telephone, :mobilephone, :fax, :email, :contact, :vatnumber, :bankaccount, :remarks )
  end

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to manage Customers"
      redirect_to new_user_session_url # halts request cycle
    end
  end
end

