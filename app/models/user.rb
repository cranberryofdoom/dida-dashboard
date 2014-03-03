class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  ROLES = %w[admin project_manager project_mentor designer]
 
  # optionally set the integer attribute to store the roles in,
  # :roles_mask is the default
  # roles_attribute :roles_mask
 
  # declare the valid roles -- do not change the order if you add more
  # roles later, always append them at the end!
  # roles :admin, :project_manager, :designer

  # validates :privilege, presence: true
  # has_one :profile
  has_and_belongs_to_many :teams
  has_many :projects, through: :teams
end
