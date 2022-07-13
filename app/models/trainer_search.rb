class TrainerSearch
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :categories, category_array: :string, default: []
  attribute :genders, gender_array: :string, default: []
  attribute :min_history_year, :integer, default: 0

  def result
    Trainer.ransack(ransack_query).result(distinct: true)
  end

  private

  def ransack_query
    {
      lessons_category_in: categories.map { |category| Lesson.categories[category.to_sym] },
      gender_in: genders.map { |gender| Trainer.genders[gender.to_sym] },
      history_year_gteq: min_history_year.presence
    }.compact
  end
end
