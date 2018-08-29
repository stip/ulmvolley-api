class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.references :player, :null => false
      t.references :training, :null => false

      t.timestamps null: false
    end
  end
end
