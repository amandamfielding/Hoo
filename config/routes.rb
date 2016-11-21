Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    resources :users, only: [:create, :show]
    resource :session, only: [:create, :destroy]
    resources :events, only: [:show, :index, :create]
    resources :companies, only: [:show, :create]
    resources :requirements, only: [:index, :create]
    resources :requests, only: [:show, :index, :create, :destroy]
  end

  root "static_pages#root"
end
