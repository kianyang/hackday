Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :receipts do #, only: [:new, :update, :create, :edit]
    get 'add_to_cart', on: :member
  end

  root to: "home#index"
end
