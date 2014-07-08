module FriendshipsHelper
  def friendship(user_id)
    friendship = if
      Friendship.where(user_id: user_id, friend_id: current_user.id) # RETURNING EMPTY ARRAY
    elsif
      current_user.friendships.where(friend_id:user_id)
    end
  end
end
