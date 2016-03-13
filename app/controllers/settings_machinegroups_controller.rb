class SettingsMachinegroupsController < ApplicationController
  before_action :require_login

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

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to manage Settings"
      redirect_to new_user_session_url # halts request cycle
    end
  end

end
