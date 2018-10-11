Rails.application.routes.draw do
  get 'leads/new'
  get 'leads/lead'

  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Blazer::Engine, at: "blazer"

  get 'pages/index'
  get 'pages/residential'
  get 'pages/commercial'
  
  post '/new_quote' => 'quotes#new_quote'
  post '/new_lead' => 'leads#new_lead'
  
  resource :quotes
  resource :employees
  resource :lead
 
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 end