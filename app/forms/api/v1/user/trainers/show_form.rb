class Api::V1::User::Trainers::ShowForm
  include ActiveModel::Model

  attr_reader :id

  validates :id, presence: true

  def initialize(params)
    @id = params[:id]
  end

  def show
    trainer = Trainer.find_by(id: valid_params[:id])

    unless trainer
      return ErrorResponse.base_response("#{I18n.t('activerecord.models.trainer')}#{I18n.t('errors.not_found')}",
                                         STATUS_NOT_FOUND)
    end

    ApiResponse.base_response(Api::V1::User::TrainersResponse.show_success(trainer), nil, STATUS_SUCCESS)
  end

  private

  def valid_params
    {
      id:
    }
  end
end
