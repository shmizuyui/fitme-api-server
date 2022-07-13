class Api::V1::User::Trainers::IndexForm
  include ActiveModel::Model

  attr_reader :page, :categories, :genders, :min_history_year

  validates :page, presence: true

  def initialize(params)
    @page = params[:page]
    @categories = params[:categories]
    @genders = params[:genders]
    @min_history_year = params[:min_history_year]
  end

  def index
    trainers = if valid_params[:query].present?
                 trainer_search = TrainerSearch.new valid_params[:query]
                 trainer_search.result
               else
                 Trainer.eager_load(:lessons)
               end

    paginated_trainers = trainers.page(valid_params[:page])
    ApiResponse.base_response(Api::V1::User::TrainersResponse.index_success(paginated_trainers), nil, STATUS_SUCCESS)
  end

  private

  def valid_params
    {
      page:,
      query: {
        categories:,
        genders:,
        min_history_year:
      }.compact
    }
  end
end
