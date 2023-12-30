class DropReservation < ActiveRecord::Migration[6.1]
  def up
    drop_table :reservations
  end
end
