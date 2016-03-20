class MachinesController < ApplicationController
  before_action :set_machine, except: [:index, :new, :create]
  before_action :require_login, except: [:index, :edit]

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

  def edit

  end

  def update
    if @machine.update(machine_params)
      flash[:success] = 'machine has been updated.'
      redirect_to machines_path
    else
      flash.now[:danger] = 'machine has not been updated.'
      render :edit
    end
  end

  def destroy
    @machine.destroy
    flash[:success] = "Machine has been deleted"
    redirect_to machines_path
  end

  private
  def machine_params
    params.require(:machine).permit(:machinetype_id, :brand_id, :model, :engine, :description, :unitprice, :purchaseprice, :vatrate, :minimalstock, :currentstock, :warehouselocation )
  end

  def set_machine
    @machine = Machine.all.find(params[:id])
  end

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to manage the Catalogue"
      redirect_to new_user_session_url # halts request cycle
    end
  end
end
