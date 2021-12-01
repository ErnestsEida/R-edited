class CreateTagTitles < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_titles do |t|
      t.string :title
      t.references :tags, polymorphic: true

      t.timestamps
    end
  end
end
