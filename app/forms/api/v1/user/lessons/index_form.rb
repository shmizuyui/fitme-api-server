class Api::V1::User::Lessons::IndexForm
  include ActiveModel::Model

  def initialize(params)
    # TODO: ページネーション機能
    # @page = params[:page]
  end

  def index
    lessons = Lesson.all
    ApiResponse.base_response(Api::V1::User::LessonsResponse.base_response(lessons), nil, STATUS_SUCCESS)
  end
end
