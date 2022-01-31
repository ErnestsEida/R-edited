class CreateRecentNews < ActiveRecord::Migration[6.1]
  def change
    create_table :recent_news do |t|
      t.string :title
      t.text :description
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
