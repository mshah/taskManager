class Goal < ActiveRecord::Base
	belongs_to :user
	has_many :tasks
	has_many :habits

	validates :progress, :presence => true
end
