class Team < ApplicationRecord

	validates_presence_of :full_name
	validates_uniqueness_of :full_name
	has_and_belongs_to_many :employees#,  class_name: "mapping_employee_teams"
	
	

end
