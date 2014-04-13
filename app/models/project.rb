class Project < ActiveRecord::Base
	
	require 'json'

	belongs_to :client
	belongs_to :team
	belongs_to :user
	has_many :posts
	validates :status, :due_date, :details, :direction, presence: true
	has_attached_file :file
	validates_attachment :file, :content_type => { :content_type => ["image/jpg", "image/gif", "image/png"] }
	validates_attachment_file_name :file, :matches => [/png\Z/, /jpe?g\Z/]
	# Explicitly do not validate
	do_not_validate_attachment_file_type :file
	validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/
	attr_accessor :mediums, :file_file_name

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