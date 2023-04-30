Rails.application.routes.draw do
  devise_for :users
<<<<<<< HEAD
  root to: 'products#index'
  resources :products do
    resources :orders, only: [:index, :create]
   end
=======
  root to: 'items#index'
>>>>>>> parent of 5b7fdee (テストコードまでの実装)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
