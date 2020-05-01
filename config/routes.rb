# frozen_string_literal: true

Rails.application.routes.draw do
  resources :profiles
  resources :artists
  resources :genres
  resources :events
  devise_for :users
  root to: 'events#index'
end
