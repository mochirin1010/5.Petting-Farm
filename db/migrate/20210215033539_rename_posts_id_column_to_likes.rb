class RenamePostsIdColumnToLikes < ActiveRecord::Migration[6.1]
  def change
    rename_column :likes, :posts_id, :post_id
  end
end
