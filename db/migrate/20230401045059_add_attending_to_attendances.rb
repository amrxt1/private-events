class AddAttendingToAttendances < ActiveRecord::Migration[7.0]
  def change
    add_column :attendances, :attending, :boolean
  end
end
