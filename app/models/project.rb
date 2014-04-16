class Project < ActiveRecord::Base
	
	require 'json'

	belongs_to :client
	belongs_to :team
	belongs_to :user
	has_many :posts
	validates :status, :due_date, :details, :direction, presence: true

	attr_accessor :mediums

	accepts_nested_attributes_for :client

	before_save do |p|
		p.mediums_json = p.mediums.to_json
	end

	after_find do |p|
		p.mediums = JSON.parse(p.mediums_json)
	end


	def kind
		return "web" ? "print" : p.mediums.include?("website")
	end

	def web?
		return kind == "web"
	end

	def print? 
		return kind == "print"
	end
end