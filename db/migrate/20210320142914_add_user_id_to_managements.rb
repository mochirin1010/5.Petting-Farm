class AddUserIdToManagements < ActiveRecord::Migration[6.1]
  def change
    add_column :managements, :user_id, :integer
    add_column :managements, :pet_id, :integer
  end
end
