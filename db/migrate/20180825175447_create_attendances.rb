class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.references :player, :null => false
      t.references :training, :null => false
      t.column :participant, :integer
      t.string :reason

      t.timestamps null: false
      t.index [:player_id, :training_id], unique: true
    end
  end
end
