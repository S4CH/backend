# frozen_string_literal: true

class User < ApplicationRecord
  has_one :mmt
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i[discord]
  serialize :role, Array

  def self.get_scorecard
    # change it to actual scorecard
    User.pluck(:id).sort
  end

  def self.find_for_discord(discord_hash, _signed_in_resource = nil)
    data = discord_hash.info
    email = data['email'] || discord_hash.extra.raw_info.email
    user = User.where(email: email, discord_uid: discord_hash.uid).first
    # Uncomment the section below if you want users to be created if they don't exist
    user ||= User.create(name: data['name'],
                         email: email,
                         discord_uid: discord_hash.uid,
                         provider: discord_hash.provider,
                         password: Devise.friendly_token[0, 20])
    user
  end
end
