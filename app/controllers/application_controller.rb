class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_api_v1_user_user!, except: [:new, :create]

  skip_before_action :verify_authenticity_token
  helper_method :current_user, :user_signed_in?
end
