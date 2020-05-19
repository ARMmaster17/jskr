class CreateRawPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :raw_posts do |t|
      t.string :title
      t.string :company
      t.string :source
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end
