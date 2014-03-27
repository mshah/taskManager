class Goal < ActiveRecord::Base
	belongs_to :user

	validates_format_of :progress, :with => /\A(?:(NotStarted)|(NeedsWork)|(OnTrack)|(Complete))\Z/, :on => :create
end
