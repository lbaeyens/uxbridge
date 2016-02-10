class SettingsMachinetypesController < ApplicationController

  def index
    @settings_machinetypes = Machinetype.all
  end

  def new
    @settings_machinetype = Machinetype.new
  end

  def create
    @settings_machinetype = Machinetype.new(machinetype_params)
    if @settings_machinetype.save
      flash[:success] = 'Machine Type has been created.'
      redirect_to settings_machinetypes_path
    else
      flash.now[:danger] = 'Machine Type has not been created.'
      render :new
    end

  end

  private
  def machinetype_params
    params.require(:machinetype).permit(:name, :machinegroup_id)
  end

end
