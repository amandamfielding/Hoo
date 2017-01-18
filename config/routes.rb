Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    resources :users, only: [:create, :show, :index]
    resource :session, only: [:create, :destroy]
    resources :events, only: [:show, :index, :create]
    resources :companies, only: [:show, :create]
    resources :requirements, only: [:index, :create]
    resources :requests, only: [:show, :index, :create, :destroy, :update]
    get "test", to: "sessions#test"
  end

  root "static_pages#root"
end
