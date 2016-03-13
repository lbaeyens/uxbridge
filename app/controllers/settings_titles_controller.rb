class SettingsTitlesController < ApplicationController
  before_action :require_login

  def index
    @settings_titles = Title.all
  end

  def new
    @settings_title = Title.new
  end

  def create
    @settings_title = Title.new(title_params)
    if @settings_title.save
      flash[:success] = 'Title has been created.'
      redirect_to settings_titles_path
    else
      flash.now[:danger] = 'Title has not been created.'
      render :new
    end

  end

  private
  def title_params
    params.require(:title).permit(:title)
  end

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to manage Settings"
      redirect_to new_user_session_url # halts request cycle
    end
  end

end
