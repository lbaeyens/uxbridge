class SettingsBrandsController < ApplicationController
  before_action :require_login

  def index
    @settings_brands = Brand.all
  end

  def new
    @settings_brand = Brand.new
  end

  def create
    @settings_brand = Brand.new(brand_params)
    if @settings_brand.save
      flash[:success] = 'Brand has been created.'
      redirect_to settings_brands_path
    else
      flash.now[:danger] = 'Brand has not been created.'
      render :new
    end

  end

  private
  def brand_params
    params.require(:brand).permit(:name)
  end

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to manage Settings"
      redirect_to new_user_session_url # halts request cycle
    end
  end

end
