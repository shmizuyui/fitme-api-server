class Api::V1::HealthChecksController < ApplicationController
  def index
    render json: { status: 'healthy' }, status: STATUS_SUCCESS
  end
end
