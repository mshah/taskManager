class Goal < ActiveRecord::Base
	belongs_to :user
	has_many :tasks
	has_many :habits

	validates :progress, :presence => true
	validates :description, :presence => true	

	def getProgress
		@tasks = Task.where(:goal_id => :id).order("due_date ASC")
		progress_total = 0
		count = 0
    @tasks.each do |task|
    	count = count + 1
    	progress_total = progress_total		
    end
    return progress_total / count
	end

end
