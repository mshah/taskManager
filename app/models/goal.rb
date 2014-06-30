class Goal < ActiveRecord::Base
	belongs_to :user
    has_many :behaviors
	has_many :tasks
	has_many :habits

	validates :description, :presence => true	

	def getProgress
		progress_total = 0
		count = 0
		tasks.map do |task|
    	count = count + 1
    	progress_total = progress_total	+ task.progress	
    end
		habits.map do |habit|
    	if habit.done
    		progress_total = progress_total + 3
    		count = count + 1
    	else
    		progress_total = progress_total + 0
    		count = count + 1
    	end    		
    end
    goal_progress = 0
    if count == 0
    	goal_progress = 3
    else
    	goal_progress = progress_total / count
    end
    return goal_progress
	end

end
