module BlindDatesHelper

	def blind_date_employee_ids_tag
		select_tag "blind_date[employee_ids]", grouped_options_for_select(BlindDate.get_unassigned_group_employees), :multiple => true, size: "5X40", class: "form-control", required: true
	end

	def blind_date_group_leader_tag
		select_tag "blind_date[group_leader_id]", grouped_options_for_select(BlindDate.get_unassigned_group_employees), class: "form-control", required: true
	end

end
