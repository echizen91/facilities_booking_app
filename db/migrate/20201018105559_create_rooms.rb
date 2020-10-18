class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :location
      t.string :capacity
      t.string :classification

      t.timestamps
    end
  end
end
