class Api::V1::User::LessonsController < ApplicationController
  def index
    form = Api::V1::User::Lessons::IndexForm.new
    response = form.index
    render json: response
  end

  def show
    form = Api::V1::User::Lessons::ShowForm.new(params)
    response = form.show
    render json: response
  end
end