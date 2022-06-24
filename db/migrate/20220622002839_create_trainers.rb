class CreateTrainers < ActiveRecord::Migration[7.0]
  def change
    create_table :trainers do |t|
      t.string :name, null: false
      t.string :name_kana, null: false
      t.string :gender, null: false
      t.integer :history_year, null: false
      t.string :image, null: false
      t.text :message, null: false

      t.timestamps
    end
  end
end
