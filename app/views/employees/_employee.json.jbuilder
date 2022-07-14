json.extract! employee, :id, :emp_name, :dob, :email, :created_at, :updated_at
json.url employee_url(employee, format: :json)
