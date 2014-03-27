class Habit < ActiveRecord::Base
	belongs_to :user
	belongs_to :goal

	validates_format_of :interval, :with => /\A(?:(Daily)|(Weekly)|(Monthly))\Z/, :on => :create
end
