# frozen_string_literal: true

Rails.application.routes.draw do

  resources :users do
    #resources :bins, only: [:new, :create, :index, :destroy, :show]
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :bins, only: [:new, :create, :index, :destroy, :show]
  get 'index/index'

  resources :items do
    #resources :bins, only: [:new, :create, :index, :destroy, :show]
  end

  root 'index#index'
  post 'bins/add', to: 'bins#add', as: :add_to_bin
  # get 'users/:id/:item_id/:amount', to: 'users#add_to_bin', as: :add_to_bin
  # get 'users/:id/clear', to: 'users#clear_bin', as: :clear_bin
end
