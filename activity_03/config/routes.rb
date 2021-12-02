Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :books
      resources :categories
      resources :companies
      resources :games
      resources :platforms
    end
  end
end
