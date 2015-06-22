Rails.application.routes.draw do
  resources :clients
  resources :details
  resources :orders
  devise_for :users
  authenticated :user do
    root :to => 'home#index', :as => :authenticated_root
  end
  root :to => redirect('/users/sign_in')
end
