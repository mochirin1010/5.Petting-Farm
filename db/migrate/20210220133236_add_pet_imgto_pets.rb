class AddPetImgtoPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :pet_img, :string
  end
end
