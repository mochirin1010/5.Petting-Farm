class ChangeDatatype < ActiveRecord::Migration[6.1]
  def change
    change_column :pets, :introduction, :text
  end
end
