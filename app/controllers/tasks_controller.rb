class TasksController < ApplicationController
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.where(:user_id => current_user).order("due_date ASC") 
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = current_user.tasks.build
  end

  # GET /tasks/1/edit
  def edit
  end

  def edit_from_goals
    @task = Task.find(params[:id])
  end

  # GET /tasks/new_from_goal
  def new_from_goal
    @task = current_user.tasks.build(:goal_id =>params[:goal_id])
  end    

  # POST /tasks
  def create
    @task = current_user.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        if @task.goal_id == 0
          format.html { redirect_to tasks_url, notice: 'Task was successfully updated.' }
        else
          format.html { redirect_to goal_url(:id => @task.goal_id), notice: 'Task was successfully updated.' }
        end
      else
        format.html { render action: 'new' }
      end
    end
  end

  def progress_up_action
    respond_to do |format|
      @task = Task.find(params[:id])
      if @task.progress < 3
        newprogress = @task.progress + 1
        @task.progress = newprogress
      end
      @task.update_attributes(params[:progress])
      format.html { redirect_to tasks_url, notice: 'Task was successfully updated.' }
    end
  end

  def progress_down_action
    respond_to do |format|
      @task = Task.find(params[:id])
      if @task.progress > 0
        newprogress = @task.progress - 1
        @task.progress = newprogress
      end
      @task.update_attributes(params[:progress])
      format.html { redirect_to tasks_url, notice: 'Task was successfully updated.' }
    end
  end  

  def progress_up_action_from_goals
    respond_to do |format|
      @task = Task.find(params[:id])
      if @task.progress < 3
        newprogress = @task.progress + 1
        @task.progress = newprogress
      end
      @task.update_attributes(params[:progress])
      format.html { redirect_to goals_url, notice: 'Task was successfully updated.' }
    end
  end

  def progress_down_action_from_goals
    respond_to do |format|
      @task = Task.find(params[:id])
      if @task.progress > 0
        newprogress = @task.progress - 1
        @task.progress = newprogress
      end
      @task.update_attributes(params[:progress])
      format.html { redirect_to goals_url, notice: 'Task was successfully updated.' }
    end
  end  

    def progress_up_action_from_goal
    respond_to do |format|
      @task = Task.find(params[:id])
      if @task.progress < 3
        newprogress = @task.progress + 1
        @task.progress = newprogress
      end
      @task.update_attributes(params[:progress])
      format.html { redirect_to goal_url(:id => @task.goal_id), notice: 'Task was successfully updated.' }
    end
  end

  def progress_down_action_from_goal
    respond_to do |format|
      @task = Task.find(params[:id])
      if @task.progress > 0
        newprogress = @task.progress - 1
        @task.progress = newprogress
      end
      @task.update_attributes(params[:progress])
      format.html { redirect_to goal_url(:id => @task.goal_id), notice: 'Task was successfully updated.' }
    end
  end  

  # PATCH/PUT /tasks/1
  def update
    respond_to do |format|
      if @task.update(task_params)
        if @task.goal_id == 0
          format.html { redirect_to tasks_url, notice: 'Task was successfully updated.' }
        else
          format.html { redirect_to goal_url(:id => @task.goal_id), notice: 'Task was successfully updated.' }
        end
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url }
    end
  end

  private
    def correct_user
      @task = current_user.tasks.find_by(id: params[:id])
      redirect_to tasks_path, notice: "Not authorized to edit this task" if @task.nil?
    end  
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :due_date, :progress, :goal_id, :sticky)
    end
end
