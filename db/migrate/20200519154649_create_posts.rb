class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :company
      t.string :source
      t.string :description
      t.string :url
      t.integer :score

      t.timestamps
    end
  end
end
