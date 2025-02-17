# frozen_string_literal: true

Rails.application.routes.draw do
  get '/health_check', to: 'health_check#index'

  namespace :api do
    namespace :v1 do
      # devise_for :users, :path_names => { :sign_out => 'logout', :password => 'secret', :confirmation => 'verification' } do
      #   post '/register'  => 'api/v1/registrations#create'
      # end
      devise_for :users, skip: %i[registrations]
      namespace :admin do
        jsonapi_resources :internal_feedback, only: %i[index update]
        jsonapi_resources :users, only: %i[index]
        jsonapi_resources :certification, only: %i[index create update]
        jsonapi_resources :challenge, only: %i[show index create update] do
          collection do
            get :self_created_challenges
          end
          member do
            post :add_testcase
            put :update_testcase
            get :testcases
            delete :delete_testcase
            put :update_company_tags
          end
        end
        jsonapi_resources :minibootcamp do
          collection do
            get :custom_image, to: 'minibootcamp#fetch_custom_image'
            post :custom_image, to: 'minibootcamp#upload_custom_image'
          end
        end
        jsonapi_resources :frontend_question
        jsonapi_resources :company, only: %i[index create update]
      end
      jsonapi_resources :users, only: %i[index show update create] do
        member do
          get :get_by_username, :certifications
        end
        collection do
          post :register
          post :reset_password, :reset_password_initiator
          post :email_verification, :email_verification_initiator
          get :report, :leaderboard, :me, :get_token
          put :left_discord, :update_bot_token_to_google_user, :onboard, :update_discord_username, :upload_files
          post :login, :connect_discord
          delete :logout
        end
      end

      jsonapi_resources :contents, only: %i[index show]
      jsonapi_resources :submissions, only: %i[create]
      jsonapi_resources :frontend_submissions, only: %i[create]
      jsonapi_resources :frontend_questions, only: %i[show]
      jsonapi_resources :groups, only: %i[show index] do
        jsonapi_relationships
        collection do
          delete :delete_group
          put :update_group_name, :update_batch_leader
        end
      end
      jsonapi_resources :group_members, only: %i[index show] do
        collection do
          post :update_user_group
        end
      end
      jsonapi_resources :college, only: %i[index]
      jsonapi_resources :scrums, only: %i[create index update]
      jsonapi_resources :weekly_todo, only: %i[create index update] do
        member do
          get :streak
        end
      end
      jsonapi_resources :batch_leader_sheet, only: %i[create index update]
      jsonapi_resources :markdown, only: %i[index]
      jsonapi_resources :minibootcamp, only: %i[show index] do
        collection do
          get :menu
          get :predefined_templates
        end
      end
      jsonapi_resources :minibootcamp_submissions, only: %i[show index create update]
      jsonapi_resources :frontend_questions, only: %i[show]
      jsonapi_resources :internal_feedback, only: %i[create index]
      jsonapi_resources :link, only: %i[show]
      jsonapi_resources :hackathon, only: %i[create index update show]
      jsonapi_resources :notification_bot, only: %i[index]
      jsonapi_resources :notification, only: %i[create index]
      jsonapi_resources :event, only: %i[create index]
      jsonapi_resources :challenge, only: %i[create index show update] do
        collection do
          get '/:id/submissions', to: 'challenge#submissions'
          get :fetch_by_slug
        end
        member do
          get :companies
          get :submissions
          get :template
        end
      end
      jsonapi_resources :language, only: %i[index]
      jsonapi_resources :algo_submission, only: %i[create show update] do
        collection do
          put :callback
        end
      end
      jsonapi_resources :certification, only: %i[show]
      jsonapi_resources :frontend_project, only: %i[show index create update destroy]
      jsonapi_resources :company, only: %i[index create]
    end
  end
end
