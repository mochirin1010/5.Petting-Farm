Rails.application.routes.draw do
  root "home#top"
  get "/about" => "home#about"

  # post "likes/:post_id/create" => "likes#create"
  # post "likes/:post_id/destroy" => "likes#destroy"

  devise_for :users
  resources :users, only: [:show]
  resources :posts do
    post 'add' => 'likes#create'
    delete '/add' => 'likes#destroy'
  end
  resources :pets

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
