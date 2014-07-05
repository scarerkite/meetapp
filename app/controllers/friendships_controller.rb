class FriendshipsController < Devise::RegistrationsController
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])

    if @friendship.save
      redirect_to root_url, notice: 'Friend was successfully added.'
    else
      redirect_to root_url, notice: 'Unable to add friend'
    end
  end







end