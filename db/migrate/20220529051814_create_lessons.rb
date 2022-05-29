class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.string :title, null: false
      t.integer :category, null: false, default: 1
      t.integer :price, null: false

      t.timestamps
    end
  end
end
