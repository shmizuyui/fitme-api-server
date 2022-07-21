class Api::V1::User::Auth::SessionsController < ApplicationController
  def index
    if current_api_v1_user_user # TODO: パスの切り方変える
      render json: { is_login: true, data: current_api_v1_user_user }
    else
      render json: { is_login: false, message: 'ユーザーが存在しません' }
    end
  end
end
