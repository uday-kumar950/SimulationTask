require "rails_helper"

describe TeamsController, :type => :controller do
  it "initializes a new team" do
    get :new
    assigns(:team).should_not be_nil
  end

  describe "create" do
    context "with valid params" do
      it "creates an team" do
        team_attributes = {full_name: "Enzo restaurant"}

        post :create, params: {team: team_attributes}

        Team.last.should_not be_nil
      end
    end


    context "GET #show" do
     team = Team.create(full_name: "Enzo restaurant")
     it "requires login" do
      team_id = Team.last.id
      get :show, params: {id: team_id}
          #expect(Song.find_by_title("Like a Rolling Stone")).to eq(@song)
          expect(response).to have_http_status(:success)
        end
      end    


      describe "destroy" do
        context "failing the destroy function" do
          team = Team.create(full_name: "Enzo restaurant")

          before do
            allow(team).to receive(:destroy).and_return(false)
          end 

          it "renders delete" do           
            team_id = Team.last.id  
            delete :destroy, params: { id: team_id }
            expect(Team.last.try(:id)).to eq nil
          end
        end
      end 
    end
  end
