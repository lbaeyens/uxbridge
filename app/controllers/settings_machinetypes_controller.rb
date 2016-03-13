class SettingsMachinetypesController < ApplicationController
  before_action :require_login

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

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to manage Brand settings"
      redirect_to new_user_session_url # halts request cycle
    end
  end

end
