class EmployeesTeam < ApplicationRecord
  belongs_to :employee
  belongs_to :team
end
