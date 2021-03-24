class RenameStartTimeColumnToManagements < ActiveRecord::Migration[6.1]
  def change
    rename_column :managements, :start_time, :start_date
  end
end
