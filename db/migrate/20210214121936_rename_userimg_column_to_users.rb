class RenameUserimgColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :Userimg, :user_img
  end
end
