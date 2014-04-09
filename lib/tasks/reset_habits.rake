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
		time = DateTime.now
		habits.each do |habit|
			if habit.interval == 'Daily'
				if habit.done
					streak = habit.streak + 1
					habit.update(done: false, streak: streak)
				else
					habit.update(streak: 0)
				end
			end	
			if habit.interval == 'Weekly'
				if time.wday == 0
					if habit.done
						streak = habit.streak + 1
						habit.update(done: false, streak: streak)
					else
						habit.update(streak: 0)
					end
				end
			end						
			if habit.interval == 'Monthly'
				if time.day == 1
					if habit.done
						streak = habit.streak + 1
						habit.update(done: false, streak: streak)
					else
						habit.update(streak: 0)
					end
				end
			end
		end	

		tasks = Task.all
		tasks.each do |task|
			if task.progress == 3
				task.destroy
			else
				if time > task.due_date
					if task.sticky == 0
						push_date = time + 1.weeks
						task.update(due_date: push_date)
					elsif task.sticky == 1
						push_date = time + 1.days
						task.update(due_date: push_date)
					end 
				end
			end
		end	
	end

end

namespace :tasks do

	desc "change dueDate to now"
	task :push_due_date => :environment do
		tasks = Task.all
		time = DateTime.now
		
		tasks.each do |task|
			if task.progress == 3
				task.destroy
			else
				if time.to_i > task.due_date.to_i
					puts task.description
					if task.sticky == 0
						new_date_seconds = time.to_i + 1.week.to_i
						push_date = Time.at(new_date_seconds).to_datetime
						task.update(due_date: push_date)
					elsif task.sticky == 1
						new_date_seconds = time.to_i + 1.day.to_i
						push_date = Time.at(new_date_seconds).to_datetime
						task.update(due_date: push_date)
					end 
				end
			end
		end	
	end	


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
			task.update(due_date: DateTime.now)
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


