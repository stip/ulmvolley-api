class AddPresenceAndResonColumnToAttendances < ActiveRecord::Migration[5.2]
  def change
    add_column :Attendances, :Presence, :string
    add_column :Attendances, :Reason, :string
  end
end
