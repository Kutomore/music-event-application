# frozen_string_literal: true

Rails.application.routes.draw do
  resources :profiles, only: %i[show edit update]
  resources :artists
  resources :genres
  resources :events

  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'events#index'
end
