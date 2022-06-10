class Api::V1::User::Lessons::IndexForm
  include ActiveModel::Model

  attr_reader :page

  validates :page, presence: true

  def initialize(params)
    @page = params[:page]
  end

  def index
    lessons = Lesson.all.page(valid_params[:page])
    ApiResponse.base_response(Api::V1::User::LessonsResponse.index_success(lessons), nil, STATUS_SUCCESS)
  end

  private

  def valid_params
    { page: page }
  end
end
