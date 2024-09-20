class CreateStatistics < ActiveRecord::Migration[7.1]
  def change
    create_table :statistics do |t|
      t.string :type, null: false
      t.references :player, null: false, foreign_key: true
      t.integer :goals, default: 0
      t.integer :saves, default: 0
      t.integer :clearances, default: 0
      t.integer :tackles, default: 0
      t.integer :interceptions, default: 0
      t.integer :block_crosses, default: 0
      t.integer :assists, default: 0
      t.integer :shots_on_target, default: 0
      t.integer :successful_dribbles, default: 0
      t.integer :shot_blocks, default: 0
      t.integer :fouls_won, default: 0

      t.timestamps
    end
    add_index :statistics, :type
  end
end
