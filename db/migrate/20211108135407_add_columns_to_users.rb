class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string , default: ""
    add_column :users, :nsfw, :boolean , default: false
    add_column :users, :karma_points, :int , default: 0
  end
end
