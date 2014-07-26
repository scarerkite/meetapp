class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role == "admin"
      can :manage, :all
    elsif user.role == "user"
      can :create, [Comment, Event]  
      can :destroy, Comment do |comment|  
        comment.try(:user) == user
      end  
      can [:update, :destroy, :cancel], Event do |event|  
        event.try(:host) == user 
      end
      can :read, Event do |event|
          event.host_id == user.id || event.invitations.select{ |invitation| invitation.invitee_id==user.id}.any?

      end
    end     
  end
end
