class AddStartableToSources < ActiveRecord::Migration[6.1]
  def change
    add_column :sources, :startable, :boolean, default: false
  end
end
