class Api::V1::User::Lessons::IndexForm
  include ActiveModel::Model

  attr_reader :page, :categories, :genders, :min_price, :max_price, :order

  validates :page, presence: true

  def initialize(params)
    @page = params[:page]
    @categories = params[:categories]
    @genders = params[:genders]
    @min_price = params[:min_price]
    @max_price = params[:max_price]
    @order = params[:order]
  end

  def index
    lessons = if valid_params[:query].present?
                lesson_search = LessonSearch.new valid_params[:query]
                lesson_search.result
              else
                Lesson.eager_load(:trainer)
              end
    sorts = case valid_params[:order]
            when 'low_price'
              lessons.order('price ASC')
            when 'high_price'
              lessons.order('price DESC')
            when 'created_at_desc'
              lessons.order('lessons.created_at DESC')
            end
    paginated_lessons = sorts.page(valid_params[:page])
    ApiResponse.base_response(Api::V1::User::LessonsResponse.index_success(paginated_lessons), nil, STATUS_SUCCESS)
  end

  private

  def valid_params
    {
      order:,
      page:,
      query: {
        categories:,
        genders:,
        min_price:,
        max_price:
      }.compact
    }
  end
end
