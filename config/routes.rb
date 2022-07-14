Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :inventories, only: :index do

    resources :products, shallow: true do
      get :listing, on: :collection
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
