Rails.application.routes.draw do
  resources :books
  resources :categories
  resources :games
  resources :platforms
  resources :companies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
