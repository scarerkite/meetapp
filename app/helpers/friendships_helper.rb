module FriendshipsHelper
  def friendship(user_id)
    # friendship = Friendship.where(user_id: user_id, friend_id: current_user.id)
    # if friendship.empty?
    #    friendship = current_user.friendships.where(friend_id:user_id)
    # elsif
    #   friendship.empty?
    #   false
    # end

    

    friendship = Friendship.where(user_id: params[:id], friend_id: current_user.id)
    if friendship.empty?
      friendship = current_user.friendships.where(friend_id: params[:id])
    end
    if friendship.empty?
      false
    end

  end
end
