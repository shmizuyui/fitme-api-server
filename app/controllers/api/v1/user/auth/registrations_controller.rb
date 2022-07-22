class Api::V1::User::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  # frozen_string_literal: true

  private

  def sign_up_params
    params.permit(:email, :password, :password_confirmation, :name, :name_kana, :gender)
  end
end
