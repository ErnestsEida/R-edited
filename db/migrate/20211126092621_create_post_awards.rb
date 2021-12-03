class CreatePostAwards < ActiveRecord::Migration[6.1]
  def change
    create_table :post_awards do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.references :award, null: false, foreign_key: true

      t.timestamps
    end
  end
end
