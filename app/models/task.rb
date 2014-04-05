class Task < ActiveRecord::Base
	belongs_to :user
	belongs_to :goal

	validates :progress, :presence => true
	validates :dueDate, :presence => true
	validates :description, :presence => true

end