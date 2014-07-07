module FriendshipsHelper
  def friends?
    if params[:user_id]
      Friendship.where(id: params[:id], user_id: params[:user_id], friend_id: current_user.id)
    elsif params[:friend_id]
      current_user.friendships.where(id: params[:id], friend_id: params[:friend_id])
    end

  end


  # def accept_friend(friend)
  #   @friendship.approved = true
  #   @friendship.saved
  # end

  # def decline_friend(friend)
  #   @friendship.approved = false
  #   @friendship.saved
  # end

end