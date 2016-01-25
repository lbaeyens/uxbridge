Rails.application.routes.draw do
  devise_for :users

  resources :settings_titles, :settings_brands, :settings_repairstates, :settings_machinegroups

  get 'dashboard/index'

  root to: 'dashboard#index'
end
