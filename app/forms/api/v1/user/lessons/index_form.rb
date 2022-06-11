class Api::V1::User::Lessons::IndexForm
  include ActiveModel::Model

  attr_reader :page, :categories, :max_price, :min_price, :genders

  validates :page, presence: true

  def initialize(params)
    @page = params[:page]
    @categories = params[:categories]
    @max_price = params[:max_price]
    @min_price = params[:min_price]
    @genders = params[:genders]
  end

  def index
    lessons = if valid_params[:query].present?
                lesson_search = LessonSearch.new valid_params[:query]
                lesson_search.result
              else
                Lesson.all
              end
    paginated_lessons = lessons.page(valid_params[:page])
    ApiResponse.base_response(Api::V1::User::LessonsResponse.index_success(paginated_lessons), nil, STATUS_SUCCESS)
  end

  private

  def valid_params
    {
      page:,
      query: {
        categories: categories,
        max_price: max_price,
        min_price: min_price,
        genders: genders
      }.compact
    }
  end
end
