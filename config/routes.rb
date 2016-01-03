Rails.application.routes.draw do
#  get 'settings_titles/index'
#  get 'settings_titles/new'
#  post 'settings_titles/new'


  devise_for :users

  resources :settings_titles, :settings_brands

  get 'dashboard/index'

  root to: 'dashboard#index'
end
