class Api::V1::User::LessonsResponse
  class << self
    def index_success(lessons)
      {
        lessons: lessons.map { |lesson| build_lesson(lesson) }
      }
    end

    def show_success(lesson)
      {
        lesson: build_lesson(lesson)
      }
    end

    private

    def build_lesson(lesson)
      {
        id: lesson.id,
        title: lesson.title,
        price: lesson.price,
        category: lesson.category,
        time: lesson.time,
        content: lesson.content
      }
    end
  end
end
