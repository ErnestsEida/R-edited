class CreateTokenPacks < ActiveRecord::Migration[6.1]
  def change
    create_table :token_packs do |t|
      t.string :title
      t.decimal :price
      t.text :description
      t.integer :token_amount

      t.timestamps
    end
  end
end
