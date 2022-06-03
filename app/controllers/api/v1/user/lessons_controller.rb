class Api::V1::User::LessonsController < ApplicationController
  def index
    form = Api::V1::User::Lessons::IndexForm.new
    response = form.index
    render json: response
  end
end
