Rails.application.routes.draw do
  resources :products do
    get :listing, on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'products#index'
end
