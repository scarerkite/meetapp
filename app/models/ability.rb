class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role == :admin
      can :manage, :all
    elsif user.role == :user
      can :create, [Comment, Event]  
      can :destroy, Comment do |comment|  
        comment.try(:user) == user
      end  
      can [:read, :update, :destroy], Event do |event|  
        event.try(:user) == user 
      end
      # can read event if invitation
      # can comment on event if invitation
    end     
  end
end
