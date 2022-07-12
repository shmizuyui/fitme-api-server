class Api::V1::User::Lesson::SearchesController < ApplicationController
  def index
    response = ApiResponse.base_response(Api::V1::User::Lesson::SearchesResponse.index_success, nil, STATUS_SUCCESS)
    render json: response
  end
end
