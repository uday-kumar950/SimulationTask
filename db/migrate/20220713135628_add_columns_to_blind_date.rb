class AddColumnsToBlindDate < ActiveRecord::Migration[7.0]
  def change
    add_column :blind_dates, :lunch_date, :date
    add_column :blind_dates, :restaurant_name, :string
    #add_column :blind_dates, :group_leader, :integer
    add_reference :blind_dates, :group_leader, index: true, foreign_key: {to_table: :employees}
  end
end
