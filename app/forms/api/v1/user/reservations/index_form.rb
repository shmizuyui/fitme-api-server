class Api::V1::User::Reservations::IndexForm
  include ActiveModel::Model

  attr_reader :user_id

  validates :user_id, presence: true

  def initialize(params)
    @user_id = params[:user_id]
  end

  def index
    user = User.find_by(id: valid_params[:user_id])

    unless user
      return ErrorResponse.base_response("#{I18n.t('activerecord.models.user')}#{I18n.t('errors.not_found')}", STATUS_NOT_FOUND)
    end

    reservations = user.reservations.eager_load(:lesson)
    ApiResponse.base_response(Api::V1::User::ReservationsResponse.index_success(reservations), nil, STATUS_SUCCESS)
  end

  private

  def valid_params
    {
      user_id:
    }
  end
end
