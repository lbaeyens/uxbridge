class CustomersController < ApplicationController
  before_action :require_login

  def index
    @customers = Customer.all
  end

  private
  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to manage Customers"
      redirect_to new_user_session_url # halts request cycle
    end
  end
end

