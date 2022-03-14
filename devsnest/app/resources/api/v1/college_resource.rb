# frozen_string_literal: true

module Api
  module V1
    class CollegeResource < JSONAPI::Resource
      attributes :id, :name
    end
  end
end
