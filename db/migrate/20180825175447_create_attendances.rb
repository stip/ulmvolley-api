class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.references :player, :null => false
      t.references :training, :null => false
      t.integer :presence
      t.string :reason

      t.timestamps null: false
    end

    add_index :attendances, [:player_id, :training_id], unique: true
  end
end
