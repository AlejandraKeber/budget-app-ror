Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"

  resources :groups, only: [:index, :new, :create] do
    resources :payments, only: [:index, :new, :create]
  end
end
