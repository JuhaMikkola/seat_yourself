class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :restaurant_id
      t.string :user_id

      t.timestamps
    end
  end
end
