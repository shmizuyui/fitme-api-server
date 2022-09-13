class AddDetailsToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :start_at, :datetime, null: false
  end
end
