class AddPetIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :pet_id, :integer
  end
end
