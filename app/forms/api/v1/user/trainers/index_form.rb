class Api::V1::User::Trainers::IndexForm
  include ActiveModel::Model

  attr_reader :page

  validates :page, presence: true

  def initialize(params)
    @page = params[:page]
  end

  def index
    trainers = Trainer.eager_load(:lessons).page(valid_params[:page])
    ApiResponse.base_response(Api::V1::User::TrainersResponse.index_success(trainers), nil, STATUS_SUCCESS)
  end

  private

  def valid_params
    {
      page:
    }
  end
end
