class SettingsBrandsController < ApplicationController

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

end
