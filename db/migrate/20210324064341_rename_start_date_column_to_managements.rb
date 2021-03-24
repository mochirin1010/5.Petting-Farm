class RenameStartDateColumnToManagements < ActiveRecord::Migration[6.1]
  def change
    rename_column :managements, :start_date, :start_time
  end
end
