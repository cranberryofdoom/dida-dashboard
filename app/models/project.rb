class Project < ActiveRecord::Base
	require 'json'

	belongs_to :client
	belongs_to :team
	belongs_to :user
	validates :status, :due_date, :details, :direction, presence: true

	attr_accessor :mediums

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