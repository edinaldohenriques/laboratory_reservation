class RenameType < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :type, :equipment_type
  end
end
