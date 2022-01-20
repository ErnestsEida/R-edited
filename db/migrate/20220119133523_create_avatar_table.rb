class CreateAvatarTable < ActiveRecord::Migration[6.1]
  def change
    create_table :avatars do |t|
      t.string :hat_type, default: "none"
      t.integer :hat_size, default: 5
      t.string :hat_color, default: "#666666"
      t.string :face_type, default: "smile"
      t.integer :face_size, default: 5
      t.string :face_color, default: "#666666"
      t.boolean :shirt_on, default: false
      t.string :shirt_color, default: "#666666"
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
