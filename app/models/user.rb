class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :privilege, presence: true

  has_and_belongs_to_many :teams
  has_many :projects, through: :teams
end
