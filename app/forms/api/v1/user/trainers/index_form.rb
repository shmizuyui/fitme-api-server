class Api::V1::User::Trainers::IndexForm
  include ActiveModel::Model

  attr_reader :page, :categories, :genders, :min_history_year, :order

  validates :page, presence: true

  def initialize(params)
    @page = params[:page]
    @categories = params[:categories]
    @genders = params[:genders]
    @min_history_year = params[:min_history_year]
    @order = params[:order]
  end

  def index
    trainers = if valid_params[:query].present?
                 trainer_search = TrainerSearch.new valid_params[:query]
                 trainer_search.result
               else
                 Trainer.eager_load(:lessons)
               end
    sorts = case valid_params[:order]
            when 'low_history'
              trainers.order('history_year ASC')
            when 'high_history'
              trainers.order('history_year DESC')
            when 'created_at_desc'
              trainers.order('trainers.created_at DESC')
            end
    paginated_trainers = sorts.page(valid_params[:page])
    ApiResponse.base_response(Api::V1::User::TrainersResponse.index_success(paginated_trainers), nil, STATUS_SUCCESS)
  end

  private

  def valid_params
    {
      order:,
      page:,
      query: {
        categories:,
        genders:,
        min_history_year:
      }.compact
    }
  end
end
