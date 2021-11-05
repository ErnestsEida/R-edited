class RenamePostsDescription < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :description, :content
  end
end
