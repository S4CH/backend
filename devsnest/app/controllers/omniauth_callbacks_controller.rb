# frozen_string_literal: true
# This is oauth controller to handle discord_login

class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def discord
    user = User.find_for_discord(request.env['omniauth.auth'], current_user)
    if user.persisted?
      sign_in_and_redirect user, event: :authentication
    else
      render 'There was an error while trying to authenticate you...'
    end
  end
end
