class Api::V1::User::LessonsController < ApplicationController
  def index
    form = Api::V1::User::Lessons::IndexForm.new(params)

    if form.valid?
      response = form.index
      render json: response
    else
      # TODO: ja.ymlのエラーメッセージ設定
      render json: ErrorResponse.base_response(I18n.t('errors.bad_request'), STATUS_BAD_REQUEST)
    end
  end
end
