# frozen_string_literal: true

module Api
  module V1
    # FrontendProject Resource
    class FrontendProjectResource < JSONAPI::Resource
      attributes :id, :name, :template, :public, :template_files
    end
  end
end
