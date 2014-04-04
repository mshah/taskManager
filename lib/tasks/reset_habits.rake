namespace :habits do
	desc "Rake task to reset the daily habits"
	task :resetDaily => :environment do
		habits = Habit.all
		habits.each do |habit|
			if habit.interval == 'Daily'
				if habit.done == true
					streak = habit.streak + 1
					habit.update(done: false, streak: streak)
				else
					habit.update(streak: 0)
				end
			end
		end
	end

	desc "Rake task to reset the weekly habits"
	task :resetWeekly => :environment do
		habits = Habit.all
		habits.each do |habit|
			if habit.interval == 'Weekly'
				habit.update(done: false)
			end
		end
	end

	desc "Rake task to reset the monthly habits"
	task :resetMonthly => :environment do
		habits = Habit.all
		habits.each do |habit|
			if habit.interval == 'Monthly'
				habit.update(done: false)
			end
		end
	end	

	desc "Rake task that resets everything daily"
	task :resetHeroku => :environment do
		habits = Habit.all
		time = Time.new
		habits.each do |habit|
			if habit.interval == 'Daily'
				habit.update(done: false)
			end	
			if habit.interval == 'Weekly'
				if time.wday == 0
					habit.update(done: false)
				end
			end					
			if habit.interval == 'Monthly'
				if time.day == 1
					habit.update(done: false)
				end
			end
		end	

		tasks = Task.all
		tasks.each do |task|
			if task.progress == 3
				task.destroy
			end
		end
	end	
end

namespace :tasks do
	desc "delete completed tasks"
	task :deletecomplete => :environment do
		tasks = Task.all
		tasks.each do |task|
			if task.progress == 3
				task.destroy
			end
		end
	end	

	desc "change dueDate to now"
	task :pushDate => :environment do
		tasks = Task.all
		tasks.each do |task|
			task.update(dueDate: DateTime.now)
		end
	end	

	desc "change all the progress to 0"
	task :progress0 => :environment do
		tasks = Task.all
		tasks.each do |task|
			task.update(progress: "0")
		end
		goals = Goal.all
		goals.each do |goal|
			goal.update(progress: "0")
		end		
	end

	desc "delete all the tasks"
	task :deleteAll => :environment do
		tasks = Task.all
		tasks.each do |task|
			task.destroy
		end
	end				
	
end


