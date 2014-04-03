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
				habit.reset
			end	
			if habit.interval == 'Weekly'
				if time.wday == 0
					habit.reset
				end
			end					
			if habit.interval == 'Monthly'
				if time.day == 1
					habit.reset
				end
			end
		end	
	end	

	
end


