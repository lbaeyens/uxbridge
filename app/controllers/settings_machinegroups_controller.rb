class SettingsMachinegroupsController < ApplicationController

  def index
    @settings_machinegroups = Machinegroup.all
  end

  def new
    @settings_machinegroup = Machinegroup.new
  end

  def create
    @settings_machinegroup = Machinegroup.new(machinegroup_params)
    if @settings_machinegroup.save
      flash[:success] = 'Machine Group has been created.'
      redirect_to settings_machinegroups_path
    else
      flash.now[:danger] = 'Machine Group has not been created.'
      render :new
    end

  end

  private
  def machinegroup_params
    params.require(:machinegroup).permit(:name)
  end
end
