Rails.application.routes.draw do
  post 'twilio/sms'
  get 'leads/new'
  get 'leads/lead'

  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  authenticate :user, ->(user) { user.admin? } do
    mount Blazer::Engine, at: "blazer"
  end

  
  get 'pages/index'
  get 'pages/residential'
  get 'pages/commercial'
  
   
  get 'blazer' => 'blazer/queries#home'

  post '/new_quote' => 'quotes#new_quote'
  post '/new_lead' => 'leads#new_lead'
  get '/audio_info' => 'pages#welcome'

  resource :quotes
  resource :employees
  resource :lead
 
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 end