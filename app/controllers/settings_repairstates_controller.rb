class SettingsRepairstatesController < ApplicationController
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

end
