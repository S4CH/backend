
module Api
  module V1
    class GroupcallResource < JSONAPI::Resource
      attributes :user_id, :choice
    end
  end
end
