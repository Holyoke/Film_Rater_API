Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    resources :films, only: [:index, :show]
    resources :ratings, only: [:create, :update, :destroy]
  end
end
