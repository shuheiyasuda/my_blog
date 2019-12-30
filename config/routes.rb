Rails.application.routes.draw do
  devise_for :users
  root to:"posts#index"
  resources :posts, expect: :index

  resources :regisrations, only: [:create] do
    collection do
      get "signup"
      post "signup_validates"
      get "signup_2"
    end
  end
  resources :users, only: [:show]
end
