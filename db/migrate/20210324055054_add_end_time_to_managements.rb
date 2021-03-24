class AddEndTimeToManagements < ActiveRecord::Migration[6.1]
  def change
    add_column :managements, :end_time, :time
  end
end
