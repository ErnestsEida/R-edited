class CreateTagReferences < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_references do |t|
      t.references :tagable, polymorphic: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
