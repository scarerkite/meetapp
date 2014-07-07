class UsersController < Devise::RegistrationsController
  
  before_action :authenticate_user!, only: [:invitations, :profile]
  before_action :set_user, only: [:show]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @friend_status = if current_user.pending_friend_ids.include?(@user.id)
      :pending 
    elsif current_user.friend_ids.include?(@user.id)
      :friend
    else
      :none
    end
  end

  def invitations
    @invited_events = current_user.events
  end

  def profile
    @hosted_events = current_user.hosted_events
    @invited_events = current_user.events
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
