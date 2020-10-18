class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :users, null: false, foreign_key: true
      t.references :rooms, null: false, foreign_key: true
      t.datetime :startdate
      t.datetime :enddate

      t.timestamps
    end
  end
end
