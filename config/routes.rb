Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "home#top"
  get "/about" => "home#about"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users, only: [:show]
  resources :posts do
    post 'add' => 'likes#create'
    delete '/add' => 'likes#destroy'
  end
  resources :pets

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
