class Api::V1::User::TrainersResponse
  class << self
    def index_success(trainers)
      {
        trainers: trainers.map { |trainer| build_trainer(trainer) },
        is_last_page: trainers.current_page == trainers.total_pages
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
        image: trainer.image.url,
        message: trainer.message,
        lessons: trainer.lessons
      }
    end
  end
end
