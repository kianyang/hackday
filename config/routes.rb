Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :invoices do #, only: [:new, :update, :create, :edit]
    get 'add_to_cart', on: :member
    get 'claim', on: :member
  end

  resources :receipts
  resources :rewards
  resource :profile, only: [:edit, :update]

  get 'dashboard', to: 'home#dashboard'
  get 'vendor_dashboard', to: 'home#vendor_dashboard'

  root to: "home#index"
end
