# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :employees, path: 'employees'
  devise_for :admin_users, path: 'admin_users'
  resources :kudos

  root to: "kudos#index"
  
  get 'home/index'
  root to: "kudos#index"

  namespace :admin do
    root to: 'pages#dashboard', as: :root
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
