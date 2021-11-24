class AddClosedToCommunities < ActiveRecord::Migration[6.1]
  def change
    add_column :communities, :closed, :boolean, default: false
    add_column :communities, :closed_at, :datetime
  end
end
