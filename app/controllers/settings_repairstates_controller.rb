class SettingsRepairstatesController < ApplicationController
  before_action :require_login

  def index
    @settings_repairstates = Repairstate.all
  end

  def new
    @settings_repairstate = Repairstate.new
  end

  def create
    @settings_repairstate = Repairstate.new(repairstate_params)
    if @settings_repairstate.save
      flash[:success] = 'Repair State has been created.'
      redirect_to settings_repairstates_path
    else
      flash.now[:danger] = 'Repair State has not been created.'
      render :new
    end

  end

  private
  def repairstate_params
    params.require(:repairstate).permit(:description)
  end

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to manage Settings"
      redirect_to new_user_session_url # halts request cycle
    end
  end

end
