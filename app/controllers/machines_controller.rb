class MachinesController < ApplicationController

  def index
    @machines = Machine.all
  end

  def new
    @machine = Machine.new
  end
  
  def create
    @settings_machine = Machine.new(machine_params)
    if @settings_machine.save
      flash[:success] = 'machine has been created.'
      redirect_to machines_path
    else
      flash.now[:danger] = 'machine has not been created.'
      render :new
    end

  end

  private
  def machine_params
    params.require(:machine).permit(:machinetype_id, :brand_id, :model, :engine, :description, :unitprice)
  end

end
