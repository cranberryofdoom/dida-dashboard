class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :project
	validates :content, :kind, :presence => true

	has_attached_file :attached_file,
	:styles => { :medium => "300x300>", :thumb => "100x100>" },
	:storage => :s3,
	:s3_credentials => "#{Rails.root}/config/aws.yml",
	:path => ":class/:attachment/:id/:style/:filename",
	:url => ':s3_domain_url'

end
