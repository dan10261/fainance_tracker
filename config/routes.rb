Rails.application.routes.draw do
  devise_for :users, :controllers=>{ :registrations =>"user/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :friendships
  root "welcome#index"
  get 'my_portfolio', to: "users#my_portfolio"
  get "search_stock", to: "stocks#search"
  resources :user_stocks, only: [:create,:destroy]
  resources :users, only: [:show]
  get 'my_friends', to: "users#my_friends"
  get "search_friends", to: "users#search"

end
