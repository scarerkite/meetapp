class UsersController < Devise::RegistrationsController
  require 'will_paginate/array'
  
  before_action :authenticate_user!, only: [:invitations, :profile]
  before_action :set_user, only: [:show]

  # GET /users
  def index
    @q = User.search params[:q]
    @users = @q.result(distinct: true)
  end

  def search
    index
    render :index
  end

  def friends
    @friends = current_user.friends.paginate(:page => params[:page], :per_page => 20)
  end

  # GET /users/1
  def show
    @friend_status = if current_user.pending_friend_ids.include?(@user.id)
      :pending
    elsif @user.pending_friend_ids.include?(current_user.id)
      :pending 
    elsif current_user.friend_ids.include?(@user.id)
      :friend
    else
      :none
    end
  end

  def invitations
    @pending_invitations = current_user.invitations.where("accepted IS NULL").order('created_at ASC')
  end

  def profile
    @hosted_events = current_user.hosted_events.paginate(:page => params[:page], :per_page => 4)
    @invited_events = current_user.events.order('date ASC').paginate(:page => params[:page], :per_page => 4)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :username, :bio, :image, :email, :role, :password, :password_confirmation)
    end
end
