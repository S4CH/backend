# frozen_string_literal: true

module Api
  module V1
    class CollegeController < ApplicationController
      include JSONAPI::ActsAsResourceController
      before_action :user_auth, only: %i[index]
    end
  end
end
