class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user #, null: false, foreign_key: true
      t.references :room #, null: false, foreign_key: true
      t.datetime :startdate
      t.datetime :enddate

      t.timestamps
    end
  end
end
