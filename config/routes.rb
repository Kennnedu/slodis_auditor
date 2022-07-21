Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :products do
    get :listing, on: :collection
  end

  resources :listings, only: :show
  get '/session', to: 'session#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
