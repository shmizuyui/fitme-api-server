class Api::V1::User::TrainersController < ApplicationController
  def index
    form = Api::V1::User::Trainers::IndexForm.new(params)

    if form.valid?
      response = form.index
      render json: response
    else
      render json: ErrorResponse.base_response(I18n.t('errors.bad_request'), STATUS_BAD_REQUEST)
    end
  end
end
