class FriendshipsController < ApplicationController

  before_action :authenticate_user!

  # POST /friendships
  def create
    current_user.friendships.create(friendship_params)
    flash[:notice] = "Friendship request sent..."
    redirect_to :back
  end

  def accept_invitation
    friendship = current_user.inverse_friendships.find(params[:id])
    friendship.approved = true
    friendship.save!
    redirect_to :back
  end

  def decline_invitation
    friendship = current_user.inverse_friendships.find(params[:id])
    friendship.approved = false
    friendship.save!
    redirect_to :back
  end

  # POST /friendships/99/revoke?user_id=1
  # POST /friendships/99/revoke?friend_id=2
  def revoke
    friendship = Friendship.where(user_id: params[:id], friend_id: current_user.id)
    if friendship.empty?
       friendship = current_user.friendships.where(friend_id: params[:id])
    end
    # if friendship.empty?
    #   false
    # end
    # friendship = if params[:user_id]
    #   Friendship.where(id: params[:id], user_id: params[:user_id], friend_id: current_user.id)
    # elsif params[:friend_id]
    #   current_user.friendships.where(id: params[:id], friend_id: params[:friend_id])
    # end
    # if friendship
    binding.pry
    friendship.approved = false
    friendship.save!
    # end
    redirect_to :profile
  end

  private

  def friendship_params
    params.require(:acts_as_friendable_friendship).permit(:friend_id)
  end

end