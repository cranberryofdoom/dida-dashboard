class Project < ActiveRecord::Base
	belongs_to :client
	belongs_to :team
	belongs_to :user, :through => :teams
	validates :status, :duedate, :details, :direction, :kind, presence: true
end