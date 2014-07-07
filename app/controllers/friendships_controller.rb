class FriendshipsController < Devise::RegistrationsController

  def create
    @friendship.user = current_user
    @friendship.friend = User.find(params[:id])

    if @friendship.save
      redirect_to root_url, notice: 'Friend was successfully added.'
    else
      redirect_to root_url, notice: 'Unable to add friend'
    end
  end







end