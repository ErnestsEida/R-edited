class AddSubscribersToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :subscribed_to_news, :boolean, default: false
  end
end
