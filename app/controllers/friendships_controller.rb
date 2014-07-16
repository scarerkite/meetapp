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
    friendship = Friendship.where(user_id: params[:id], friend_id: current_user.id).first
    if friendship.blank?
       friendship = current_user.friendships.where(friend_id: params[:id]).first
    end
    friendship.approved = false
    friendship.save!
    redirect_to :profile
  end

  private

  def friendship_params
    params.require(:acts_as_friendable_friendship).permit(:friend_id)
  end

end