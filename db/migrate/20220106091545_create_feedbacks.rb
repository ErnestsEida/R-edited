class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.string :header
      t.text :description

      t.timestamps
    end
  end
end
