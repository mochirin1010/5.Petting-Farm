class ChangeDataAgeToPets < ActiveRecord::Migration[6.1]
  def change
    change_column :pets, :age, :string
  end
end
