module InvitationsHelper

  def accept_invite(invitation)
    invitation.accepted = true
    invitation.save
  end

  def decline_invite(invitation)
    invitation.accepted = false
    invitation.save
  end


end
