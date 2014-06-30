class HabitsController < ApplicationController
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  # GET /habits
  # GET /habits.json
  def index
    @habits = Habit.where(:user_id => current_user).order("created_at ASC")    
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

  # GET /habits/new_from_goal
  def new_from_goal
    @habit = current_user.habits.build(:goal_id =>params[:goal_id])
  end       

  # GET /habits/1/edit
  def edit
  end   

  def edit_from_goals
    @habit = Habit.find(params[:id])
  end
  
  def toggle_action_from_goals
    respond_to do |format|
      @habit = Habit.find(params[:id])
      if @habit.done?
        @habit.done = false
      else
        @habit.done = true
        record_behavior
      end
      @habit.update_attributes(params[:done])
      if @habit.goal_id == 0
        format.html { redirect_to habits_url, notice: 'Habit was successfully updated.' }
      else
        format.html { redirect_to goals_url, notice: 'Habit was successfully updated.' }
      end
    end
  end

  def toggle_action
    respond_to do |format|
      @habit = Habit.find(params[:id])
      if @habit.done?
        @habit.done = false
      else
        @habit.done = true
        record_behavior
      end
      @habit.update_attributes(params[:done])
      if @habit.goal_id == 0
        format.html { redirect_to habits_url, notice: 'Habit was successfully updated.' }
      else
        format.html { redirect_to habits_url, notice: 'Habit was successfully updated.' }
      end
    end
  end   

  def toggle_action_from_goal
    respond_to do |format|
      @habit = Habit.find(params[:id])
      if @habit.done?
        @habit.done = false
      else
        @habit.done = true
        record_behavior
      end
      @habit.update_attributes(params[:done])
      if @habit.goal_id == 0
        format.html { redirect_to habits_url, notice: 'Habit was successfully updated.' }
      else
        format.html { redirect_to goal_url(:id => @habit.goal_id), notice: 'Habit was successfully updated.' }
      end
    end
  end  

  def reset
    if habit.done == true
      streak = habit.streak + 1
      habit.update(done: false, streak: streak)
    else
      habit.update(streak: 0)
    end
  end    

  # POST /habits
  def create
    @habit = current_user.habits.build(habit_params)
    respond_to do |format|
      if @habit.save
        if @habit.goal_id == 0
          format.html { redirect_to habits_url, notice: 'Habit was successfully updated.' }
        else
          format.html { redirect_to goal_url(:id => @habit.goal_id), notice: 'Habit was successfully updated.' }
        end
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /habits/1
  def update
    respond_to do |format|
      if @habit.update(habit_params)
        record_behavior
        if @habit.goal_id == 0
          format.html { redirect_to habits_url, notice: 'Habit was successfully updated.' }
        else
          format.html { redirect_to goal_url(:id => @habit.goal_id), notice: 'Habit was successfully updated.' }
        end
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /habits/1
  # DELETE /habits/1.json
  def destroy
    goal_id = @habit.goal_id
    @habit.destroy
    respond_to do |format|
      if goal_id.nil?
        format.html { redirect_to habits_url, notice: 'Habit was successfully deleted.'}
      else
        format.html { redirect_to goal_url(:id => goal_id), notice: 'Habit was successfully deleted.' }
      end
    end
  end

  private

    def record_behavior
      if @habit.done?
        @behavior = current_user.behaviors.build(:goal_id => @habit.goal_id, :description => @habit.description, :time => DateTime.now)
        @behavior.save
      end
    end

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
      params.require(:habit).permit(:description, :done, :interval, :goal_id, :streak)
    end
end
