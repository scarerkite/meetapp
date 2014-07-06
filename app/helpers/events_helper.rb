module EventsHelper
  def get_coords(address)
    data = Geocoder.search(address).first.data
    return data["geometry"]["location"]
  end

  def accept_friend(friend)
    @friendship.approved = true
    @friendship.saved

  end

  def decline_friend(friend)
    @friendship.approved = false
    @friendship.saved
  end

  def accept_invite(event)
    @invitation.accepted = true
    @invitation.save
  end

  def decline_invite(event)
    @invitation.accepted = false
    @invitation.save
  end

end
