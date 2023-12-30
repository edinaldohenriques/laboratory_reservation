class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations, id: :uuid do |t|
      t.date :reservation_date, null: false 
      t.integer :type, null: false 

      t.timestamps
    end
  end
end
