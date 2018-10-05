Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'pages/index'
  get 'pages/index2'
  get 'pages/indextemp'
  post '/new_quote' => 'quotes#new_quote'
  resource :quotes
  
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
