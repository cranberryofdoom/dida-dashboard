class Project < ActiveRecord::Base
	require 'json'

	belongs_to :client
	belongs_to :team
	belongs_to :user
	validates :status, :due_date, :details, :direction, :kind, presence: true

	attr_accessor :mediums

	before_save do |p|
		p.mediums_json = p.mediums.to_json
	end

	after_find do |p|
		p.mediums = JSON.parse(p.mediums_json)
	end
end