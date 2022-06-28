class CreateTrainers < ActiveRecord::Migration[7.0]
  def change
    create_table :trainers do |t|
      t.string :name, null: false
      t.string :name_kana, null: false
      t.integer :gender, null: false, default: 1
      t.integer :history_year
      t.text :career
      t.string :image
      t.text :message

      t.timestamps
    end
  end
end
