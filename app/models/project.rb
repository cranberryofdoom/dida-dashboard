class Project < ActiveRecord::Base
	belongs_to :client
	belongs_to :team
	belongs_to :user
	validates :status, :due_date, :details, :direction, :kind, presence: true
end