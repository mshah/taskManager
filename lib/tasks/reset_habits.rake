namespace :habits do
	desc "Rake task to reset the daily habits"
	task :resetDaily => :environment do
		habits = Habit.all
		habits.each do |habit|
			if habit.interval == 'Daily'
				habit.update(done: false)
			end
		end
	end

	desc "Rake task to reset the weekly habits"
	task :resetWeekly => :environment do
		habits = Habit.all
		habits.each do |habit|
			puts "habit interval: " + habit.interval
			if habit.interval == 'Weekly'
				habit.update(done: false)
				puts habit.done
				puts habit.description
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
end


