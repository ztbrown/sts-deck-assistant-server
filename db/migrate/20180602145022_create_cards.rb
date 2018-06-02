class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :picked
      t.float :winrate
      t.float :expected_winrate
      t.float :plus_minus
      t.integer :character_id

      t.timestamps
    end
  end
end
