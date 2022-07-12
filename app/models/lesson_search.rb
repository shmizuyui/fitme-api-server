class LessonSearch
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :categories, category_array: :string, default: []
  attribute :genders, gender_array: :string, default: []
  attribute :min_price, :integer, default: 0
  attribute :max_price, :integer, default: Float::INFINITY

  def result
    Lesson.ransack(ransack_query).result(distinct: true)
  end

  private

  def ransack_query
    {
      category_in: categories.map { |category| Lesson.categories[category.to_sym] },
      trainer_gender_in: genders.map { |gender| Trainer.genders[gender.to_sym] },
      price_gteq: min_price.presence,
      price_lteq: max_price.presence
    }.compact
  end
end
