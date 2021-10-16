class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.date :occurred
      t.references :state, null: false, foreign_key: true
      t.references :lead, null: false, foreign_key: true
      t.string :person
      t.text :notes

      t.timestamps
    end
  end
end
