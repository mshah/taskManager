class GoalsController < ApplicationController
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  # GET /goals
  # GET /goals.json
  def index
    @goals = Goal.where(:user_id => current_user).order("created_at ASC")   
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
  end

  # GET /goals/new
  def new
    @goal = current_user.goals.build
  end

  # GET /goals/1/edit
  def edit
  end

  # POST /goals
  def create
    @goal = current_user.goals.build(goal_params)

    respond_to do |format|
      if @goal.save
        format.html { redirect_to goals_url, notice: 'Goal was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /goals/1
  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to goals_url, notice: 'Goal was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /goals/1
  def destroy
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to goals_url }
    end
  end

  private
    def correct_user
        @goal = current_user.goals.find_by(id: params[:id])
        redirect_to goals_path, notice: "Not authorized to edit this goal" if @goal.nil?
    end     
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:description, :progress, :goal_id)
    end
end
