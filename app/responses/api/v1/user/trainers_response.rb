class Api::V1::User::TrainersResponse
  class << self
    def index_success(trainers)
      {
        trainers: trainers.map { |trainer| build_trainer(trainer) },
        current_page: trainers.current_page,
        total_page: trainers.total_pages
      }
    end

    def show_success(trainer)
      {
        trainer: build_trainer(trainer)
      }
    end

    private

    def build_trainer(trainer)
      {
        id: trainer.id,
        name: trainer.name,
        name_kana: trainer.name_kana,
        gender: trainer.gender,
        history_year: trainer.history_year,
        career: trainer.career,
        image: trainer.image.url,
        message: trainer.message,
        lessons: trainer.lessons
      }
    end
  end
end
