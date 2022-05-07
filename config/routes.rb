# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :employees, path: 'employees', controllers: { sessions: "employees/sessions" }
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions" }
  
  resources :kudos

  root to: "kudos#index"
  
  get 'home/index'

  namespace :admins do
    root to: 'pages#dashboard'
    resources :kudos, only: %i[index destroy]
    resources :employees

  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
