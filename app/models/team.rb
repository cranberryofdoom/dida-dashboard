class Team < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_many :projects
	validates :name, presence: true
end
