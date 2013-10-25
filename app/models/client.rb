class Client < ActiveRecord::Base
	has_one :organization
	has_many :projects
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
	validates :first_name, :last_name, :cell, presence: true
end
