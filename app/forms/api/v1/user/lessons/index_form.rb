class Api::V1::User::Lessons::IndexForm
  def index
    lessons = Lesson.all
    ApiResponse.base_response(Api::V1::User::LessonsResponse.base_response(lessons), nil, STATUS_SUCCESS)
  end
end
