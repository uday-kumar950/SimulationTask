class TeamsController < ApplicationController
  before_action :set_team, only: %i[ show edit update destroy ]

  # GET /teams or /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1 or /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @team = Team.new
    @unassigned_employees = Employee.get_unassigned_employees
  end

  # GET /teams/1/edit
  def edit
    @unassigned_employees = Employee.get_unassigned_employees
  end

  # POST /teams or /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      begin 
        ActiveRecord::Base.transaction do
          if @team.save
            create_employees_team_mapping(params[:employee_ids])
            format.html { redirect_to team_url(@team), notice: "Team was successfully created." }
            format.json { render :show, status: :created, location: @team }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @team.errors, status: :unprocessable_entity }
          end
        end
      rescue ActiveRecord::ActiveRecordError => e
        format.html { render :new, notice: "Error creating team!!" }
        format.json { render json: e.message, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1 or /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to team_url(@team), notice: "Team was successfully updated." }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1 or /teams/1.json
  def destroy
    @team.destroy

    respond_to do |format|
      format.html { redirect_to teams_url, notice: "Team was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.require(:team).permit(:full_name)
    end

    def create_employees_team_mapping(employee_ids)
      employees = Employee.where(id: employee_ids)
      mapping_employee_team = []
      employees.each do |emp|
        mapping_employee_team << EmployeesTeam.new(employee_id: emp.id, team_id: @team.id)
      end
      EmployeesTeam.import(mapping_employee_team)
    end
end
