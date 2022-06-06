class Api::V1::User::Lessons::ShowForm
  include ActiveModel::Model

  attr_reader :id

  validates :id, presence: true

  def initialize(params)
    @id = params[:id]
  end

  def show
    lesson = Lesson.find_by(id: valid_params[:id])

    unless lesson
      return ErrorResponse.base_response("#{I18n.t('activerecord.models.lesson')}#{I18n.t('errors.not_found')}", STATUS_NOT_FOUND)
    end

    ApiResponse.base_response(Api::V1::User::LessonsResponse.show_success(lesson), nil, STATUS_SUCCESS)
  end

  private

  def valid_params
    {
      id:
    }
  end
end
