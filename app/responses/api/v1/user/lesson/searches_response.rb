class Api::V1::User::Lesson::SearchesResponse
  class << self
    def index_success
      {
        categories: Lesson.categories.keys,
        genders: Trainer.genders.keys,
      }
    end
  end
end
