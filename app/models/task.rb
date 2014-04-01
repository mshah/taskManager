class Task < ActiveRecord::Base
	belongs_to :user
	belongs_to :goal

	validates_format_of :progress, :with => /\A(?:(NotStarted)|(NeedsWork)|(OnTrack)|(Complete))\Z/, :on => :create
	validates :dueDate, :presence => true

end