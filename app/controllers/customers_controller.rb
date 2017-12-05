class CustomersController < ApplicationController
  before_action :set_customer, except: [:index, :new, :create]
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

  def edit

  end

  def update
    if @customer.update(customer_params)
      flash[:success] = 'customer has been updated.'
      redirect_to customers_path
    else
      flash.now[:danger] = 'customer has not been updated.'
      render :edit
    end
  end

  def destroy
    @customer.destroy
    flash[:success] = "Customer has been deleted"
    redirect_to customers_path
  end

  private
  def customer_params
    params.require(:customer).permit(:title_id, :lastname, :name, :address, :postalcode_id, :telephone, :mobilephone, :fax, :email, :contact, :vatnumber, :bankaccount, :remarks )
  end

  def set_customer
    @customer = Customer.all.find(params[:id])
  end

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to manage Customers"
      redirect_to new_user_session_url # halts request cycle
    end
  end
end

