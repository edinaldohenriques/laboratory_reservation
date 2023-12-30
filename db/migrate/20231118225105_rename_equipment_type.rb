class RenameEquipmentType < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :equipment_type, :reservation_type
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
