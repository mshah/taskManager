# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
every :day, :at => '10:17 pm' do # Many shortcuts available: :hour, :day, :month, :year, :reboot
  rake "habits:resetDaily"
end

# Learn more: http://github.com/javan/whenever
