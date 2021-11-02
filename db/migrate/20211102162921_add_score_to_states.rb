class AddScoreToStates < ActiveRecord::Migration[6.1]
  def change
    add_column :states, :score, :integer, default: 0
  end
end
