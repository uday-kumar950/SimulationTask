require "rails_helper"

describe EmployeesController, :type => :controller do
  it "initializes a new employee" do
    get :new
    assigns(:employee).should_not be_nil
  end

  describe "create" do
    context "with valid params" do
      it "creates an employee" do
        employee_attributes = {emp_name: "John", dob: "20/01/1995", email: "john@gmail.com"}

        post :create, params: {employee: employee_attributes}

        Employee.last.should_not be_nil
      end
    end


    context "GET #show" do
     employee = Employee.create(emp_name: "Jack", dob: "20/01/1990", email: "jack@gmail.com")
     it "requires login" do
      emp_id = Employee.last.id
      get :show, params: {id: emp_id}
          #expect(Song.find_by_title("Like a Rolling Stone")).to eq(@song)
          expect(response).to have_http_status(:success)
        end
      end    


      describe "destroy" do
        context "failing the destroy function" do
          employee = Employee.create(emp_name: "Jack", dob: "20/01/1990", email: "jack@gmail.com")

          before do
            allow(employee).to receive(:destroy).and_return(false)
          end 

          it "renders delete" do           
            emp_id = Employee.last.id  
            delete :destroy, params: { id: emp_id }
            expect(Employee.last.try(:id)).to eq nil
          end
        end
      end 
    end
  end
