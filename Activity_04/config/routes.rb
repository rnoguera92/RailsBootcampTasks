# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  namespace 'api' do
    namespace 'v1' do
      resources :people
      resources :tags
      resources :tags_type
    end
  end
end
