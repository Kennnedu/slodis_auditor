Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products do
    get :listing, on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'products#index'
end
