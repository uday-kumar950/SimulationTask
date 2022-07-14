class CreateEmployeesTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :employees_teams do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
