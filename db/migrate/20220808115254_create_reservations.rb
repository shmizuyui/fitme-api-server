class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :lesson, foreign_key: true
      t.integer :status, null: false, default: 1
      t.timestamps
    end
  end
end
