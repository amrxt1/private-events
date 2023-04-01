class AddNameToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :name, :string
    add_column :events, :description, :text
    change_column :events, :date, :date
  end
end
