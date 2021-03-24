class ChangeDataEndTimeToManagements < ActiveRecord::Migration[6.1]
  def change
    change_column :managements, :end_time, :datetime
  end
end
