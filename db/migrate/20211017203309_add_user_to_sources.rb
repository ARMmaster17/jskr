class AddUserToSources < ActiveRecord::Migration[6.1]
  def change
    add_reference :sources, :user, null: false, foreign_key: true
  end
end
