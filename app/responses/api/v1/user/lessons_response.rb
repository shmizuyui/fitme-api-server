class Api::V1::User::LessonsResponse
  class << self
    def index_success(lessons)
      {
        lessons: lessons.map { |lesson| build_lesson(lesson) },
        current_page: lessons.current_page,
        total_page: lessons.total_pages
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
        content: lesson.content,
        trainer: build_trainer(lesson.trainer)
      }
    end

    def build_trainer(trainer)
      {
        image: trainer.image.url,
        name: trainer.name,
        gender: trainer.gender
      }
    end
  end
end
