class Team < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_many :projects
	belongs_to :project_manager, :class_name => "User" 
	belongs_to :project_mentor, :class_name => "User"
	validates :name, presence: true
end
