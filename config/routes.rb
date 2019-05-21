Rails.application.routes.draw do
  
  get "topics/index"
  get 'topics/new'

  get 'sessions/new'

  root "pages#index"
  get "pages/help"
  post "topics/comment" => "topics#comment"
  
  resources :users
  
  get   "/login",   to: "sessions#new"
  post  "/login",   to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  resources :users
  resources :topics
  
  get "favorites/index"
  post "/favorites", to: "favorites#create"
  delete "/favorites", to: "favorites#destroy"
  
  resources :users, only: [:index]
  resources :topics, only: [:index,  :create] do
    resources :comments, only: [:create]
  end
end
