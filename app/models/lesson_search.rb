class LessonSearch
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :categories, array: :string, default: []
  attribute :min_price, :integer, default: 0
  attribute :max_price, :integer, default: Float::INFINITY
  attribute :genders, array: :string, default: []

  def result
    Lesson.ransack(ransack_query)
          .result
          .distinct
  end

  private

  def ransack_query
    {
      # NOTE: 文字列（'muscle'）だと取得できない、enumは数字のみ対応しているぽいので変換
      category_in: categories.map{|category| Lesson.categories[category.to_sym] },
      price_gteq: min_price.presence,
      price_lteq: max_price.presence,
      trainer_gender_in: genders.map{|gender| Trainer.genders[gender.to_sym] },
    }.compact
  end
end
