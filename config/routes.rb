# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :admin_users, path: 'admin_users'
  devise_for :employees, path: 'employees'

  resources :kudos

  root to: "kudos#index"
  
  get 'home/index'

  namespace :admin do
    root to: 'pages#dashboard', as: :root
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
