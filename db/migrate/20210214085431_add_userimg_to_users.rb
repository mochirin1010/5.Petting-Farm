class AddUserimgToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :Userimg, :string
  end
end
