class BlindDate < ApplicationRecord

	validates_presence_of :employee_ids, :lunch_date, :restaurant_name, :group_leader_id
	validates_uniqueness_of :employee_ids, :lunch_date

	validate :check_valid_group_leader


	def self.get_unassigned_group_employees
		unassigned_group_employees = EmployeesTeam.all.group_by(&:team)
		unassigned_group_employees_hash = Hash.new
		unassigned_group_employees.each do |team, et|
			et.each do |e|
				if unassigned_group_employees_hash[team.full_name].blank?
					unassigned_group_employees_hash[team.full_name] = [[e.employee.emp_name, e.employee_id]]
				else
					unassigned_group_employees_hash[team.full_name] << [e.employee.emp_name, e.employee_id]
				end
			end
		end
		return unassigned_group_employees_hash
	end

	def check_valid_group_leader
		last_week_dates = (Date.today-7.days..Date.today).to_a
		prev_lunch_date = BlindDate.where(group_leader_id: self.group_leader_id).last.try(:lunch_date)
		if prev_lunch_date.present? && !(last_week_dates.include?(prev_lunch_date))
      		errors.add(:group_leader_id, "is already assigned as leader in previous week")
    	end 
	end
end
