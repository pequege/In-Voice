Rails.application.routes.draw do
  resources :order_items
  resources :orders
  devise_for :users
  authenticated :user do
    root :to => 'home#index', :as => :authenticated_root
  end
  root :to => redirect('/users/sign_in')
end
