Rails.application.routes.draw do
  devise_for :users
  get "users/:id" => "users#show"

  get 'posts/index' => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" =>"posts#update"
  post "posts/:id/destroy" => "posts#destroy"

  root "home#top"
  get "/about" => "home#about"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
