class AddTrainerIdToLessons < ActiveRecord::Migration[7.0]
  def change
    add_reference :lessons, :trainer, foreign_key: true
  end
end
