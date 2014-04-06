class Task < ActiveRecord::Base
	belongs_to :user
	belongs_to :goal

	validates :progress, :presence => true
	validates :due_date, :presence => true
	validates :description, :presence => true

end