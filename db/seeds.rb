# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

team1 = Team.create(full_name: "Team1")
team2 = Team.create(full_name: "Team2")
team3 = Team.create(full_name: "Team3")


created_employees = []
employee_names = ["John", "Jack" , "Cena", "Kent", "Tom", "Joe", "Kelvin", "Harry", "Dom", "Kim", "Dave", "Mario"]
employee_names.each_with_index do |emp, i|
	created_employees << Employee.create(emp_name: emp, dob: (Date.today - rand(10..30).years), email: "#{emp}@gmail.com")	
end


EmployeesTeam.create(employee_id: created_employees[0].id, team_id: team1.id)
EmployeesTeam.create(employee_id: created_employees[1].id, team_id: team1.id)
EmployeesTeam.create(employee_id: created_employees[2].id, team_id: team1.id)
EmployeesTeam.create(employee_id: created_employees[3].id, team_id: team1.id)
EmployeesTeam.create(employee_id: created_employees[4].id, team_id: team2.id)
EmployeesTeam.create(employee_id: created_employees[5].id, team_id: team2.id)
EmployeesTeam.create(employee_id: created_employees[6].id, team_id: team2.id)
EmployeesTeam.create(employee_id: created_employees[7].id, team_id: team2.id)
EmployeesTeam.create(employee_id: created_employees[8].id, team_id: team3.id)
EmployeesTeam.create(employee_id: created_employees[9].id, team_id: team3.id)
EmployeesTeam.create(employee_id: created_employees[10].id, team_id: team3.id)
EmployeesTeam.create(employee_id: created_employees[11].id, team_id: team3.id)


# BlindDate.create(employee_ids: "[\"#{created_employees[0].id}\", \"#{created_employees[4].id}\", \"#{created_employees[8].id}\"]", lunch_date: (Date.today), restaurant_name: "Enzo restaurant", group_leader_id: 8)
# BlindDate.create(employee_ids: "[\"#{created_employees[1].id}\", \"#{created_employees[5].id}\", \"#{created_employees[9].id}\"]", lunch_date: (Date.today), restaurant_name: "Italian restaurant", group_leader_id: 5)
# BlindDate.create(employee_ids: "[\"#{created_employees[2].id}\", \"#{created_employees[6].id}\", \"#{created_employees[10].id}\"]", lunch_date: (Date.today), restaurant_name: "Turkish restaurant", group_leader_id: 2)
