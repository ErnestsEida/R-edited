class CreateAwards < ActiveRecord::Migration[6.1]
  def change
    create_table :awards do |t|
      t.string :title
      t.integer :value

      t.timestamps
    end
  end
end
