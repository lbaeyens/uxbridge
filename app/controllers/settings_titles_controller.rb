class SettingsTitlesController < ApplicationController

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

end
