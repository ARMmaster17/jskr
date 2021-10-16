class CreateLeads < ActiveRecord::Migration[6.1]
  def change
    create_table :leads do |t|
      t.string :company
      t.string :position
      t.references :source, null: false, foreign_key: true
      t.string :location
      t.text :notes

      t.timestamps
    end
  end
end
