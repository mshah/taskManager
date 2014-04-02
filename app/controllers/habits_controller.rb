class HabitsController < ApplicationController
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  # GET /habits
  # GET /habits.json
  def index
    @habits = Habit.all
  end

  # GET /habits/1
  # GET /habits/1.json
  def show
  end

  # GET /habits/new
  def new
    @habit = current_user.habits.build
  end

# GET /habits/dailynew
  def newdaily
    @habit = current_user.habits.build
  end

# GET /habits/weeklynew
  def newweekly
    @habit = current_user.habits.build
  end

# GET /habits/monthlynew
  def newmonthly
    @habit = current_user.habits.build
  end      

  # GET /habits/1/edit
  def edit
  end   

  def toggle_action
    respond_to do |format|
      @habit = Habit.find(params[:id])
      if @habit.done?
        @habit.done = false
      else
        @habit.done = true
      end
      @habit.update_attributes(params[:done])
      format.html { redirect_to habits_url, notice: 'Habit was successfully updated.' }
    end
  end  

  # POST /habits
  def create
    @habit = current_user.habits.build(habit_params)

    respond_to do |format|
      if @habit.save
        format.html { redirect_to habits_url, notice: 'Habit was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /habits/1
  def update
    respond_to do |format|
      if @habit.update(habit_params)
        format.html { redirect_to habits_url, notice: 'Habit was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /habits/1
  # DELETE /habits/1.json
  def destroy
    @habit.destroy
    respond_to do |format|
      format.html { redirect_to habits_url }
    end
  end

  private
    def correct_user
        @habit = current_user.habits.find_by(id: params[:id])
        redirect_to habits_path, notice: "Not authorized to edit this habit" if @habit.nil?
    end    
    # Use callbacks to share common setup or constraints between actions.
    def set_habit
      @habit = Habit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def habit_params
      params.require(:habit).permit(:description, :done, :interval, :goal_id)
    end
end
