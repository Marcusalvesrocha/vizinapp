Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users

  root to: "pages#home"
  get 'my_detachment', to: "detachments#my"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post "verify_username", to: "users#verify_username"

  resources :notes, only: %i[index show]
  resources :documents
  resources :schedules
  resources :condos, only: %i[new create]
  resources :apartaments, only: [:index]
  resources :detachments
  resources :profiles, only: [:show]
  resources :meetings
end
