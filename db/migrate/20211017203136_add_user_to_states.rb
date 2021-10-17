class AddUserToStates < ActiveRecord::Migration[6.1]
  def change
    add_reference :states, :user, null: false, foreign_key: true
  end
end
