Rails.application.routes.draw do
  devise_for :users

  resources :machines, :customers

  resources :settings_titles, :settings_brands, :settings_repairstates, :settings_machinegroups, :settings_machinetypes

  get 'dashboard/index'

  root to: 'dashboard#index'
end
