# frozen_string_literal: true

Rails.application.routes.draw do
  get '/health_check', to: 'health_check#index'
  namespace :api do
    namespace :v1 do
      devise_for :users, skip:[:registrations],
                 controllers: {
                   omniauth_callbacks: 'api/v1/omniauth_callbacks'
                 }
      jsonapi_resources :users, only: %i[index show update create] do
        collection do
          get :report, :leaderboard, :me
          delete :log_out
          put :left_discord
        end
      end
      jsonapi_resources :contents, only: %i[index show]
      jsonapi_resources :submissions, only: %i[create]
    end
  end
end

