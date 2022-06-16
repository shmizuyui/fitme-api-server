class Api::V1::User::LessonsController < ApplicationController
  def index
    form = Api::V1::User::Lessons::IndexForm.new(params)

    if form.valid?
      response = form.index
      render json: response
    else
      render json: ErrorResponse.base_response(I18n.t('errors.bad_request'), STATUS_BAD_REQUEST)
    end
  end

  def show
    form = Api::V1::User::Lessons::ShowForm.new(params)

    if form.valid?
      response = form.show
      render json: response
    else
      render json: ErrorResponse.base_response(I18n.t('errors.bad_request'), STATUS_BAD_REQUEST)
    end
  end
end
