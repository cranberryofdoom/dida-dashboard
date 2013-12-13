class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :manage, :all if user.role == "admin"    
    
    can :read, Project, :active => true, :user_id => user.id
    end
  end
end