# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :developers do
        resources :games, only: :index
      end
      resources :games
    end
  end
end
