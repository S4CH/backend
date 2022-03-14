# frozen_string_literal: true

# college class
class College < ApplicationRecord
  def self.create_college(college_name)
    College.create(name: college_name)
  end
end
