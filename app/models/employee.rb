class Employee < ApplicationRecord
	validates_presence_of :emp_name, :dob, :email
	validates_uniqueness_of :email
	has_one :team

	def self.get_unassigned_employees
		assigned_employees = EmployeesTeam.pluck(:employee_id).uniq
		unassigned_employees = Employee.where.not(id: assigned_employees)
	end

end
