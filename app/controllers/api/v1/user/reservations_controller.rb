class Api::V1::User::ReservationsController < ApplicationController
  def create
    form = Api::V1::User::Reservations::CreateForm.new(params)

    if form.valid?
      response = form.create
      render json: response
    else
      render json: ErrorResponse.base_response(I18n.t('errors.bad_request'), STATUS_BAD_REQUEST)
    end
  end

  def index
    form = Api::V1::User::Reservations::IndexForm.new(params)

    if form.valid?
      response = form.index
      render json: response
    else
      render json: ErrorResponse.base_response(I18n.t('errors.bad_request'), STATUS_BAD_REQUEST)
    end
  end
end
