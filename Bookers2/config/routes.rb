Rails.application.routes.draw do
  get 'homes/about' => "homes#about", as: "about"
  resources :books
  resources :users
  root to: "homes#top"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
