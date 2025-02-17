# frozen_string_literal: true

module Api
  module V1
    module Admin
      # Company Resource
      class CompanyResource < JSONAPI::Resource
        attributes :id, :name, :image_url
      end
    end
  end
end
