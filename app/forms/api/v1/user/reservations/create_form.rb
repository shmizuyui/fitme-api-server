class Api::V1::User::Reservations::CreateForm
  include ActiveModel::Model

  attr_reader :user_id, :lesson_id, :start_at

  validates :user_id, :lesson_id, :start_at, presence: true

  def initialize(params)
    @user_id = params[:user_id]
    @lesson_id = params[:lesson_id]
    @start_at = params[:start_at]
  end

  def create
    user = User.find_by(id: valid_params[:user_id]) 

    unless user
      return ErrorResponse.base_response("#{I18n.t('activerecord.models.user')}#{I18n.t('errors.not_found')}", STATUS_NOT_FOUND)
    end

    lesson = Lesson.find_by(id: valid_params[:lesson_id]) 

    unless lesson
      return ErrorResponse.base_response("#{I18n.t('activerecord.models.lesson')}#{I18n.t('errors.not_found')}", STATUS_NOT_FOUND)
    end

    reservation = user.reservations.create!(lesson: lesson, start_at: valid_params[:start_at])

    ApiResponse.base_response(Api::V1::User::ReservationsResponse.create_success(reservation), nil, STATUS_SUCCESS)
  
  rescue => e
    ErrorResponse.base_response(e.message, STATUS_FATAL)
  end

  private

  def valid_params
    {
      user_id:,
      lesson_id:,
      start_at:,
    }
  end
end
