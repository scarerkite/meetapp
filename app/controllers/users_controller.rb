class UsersController < Devise::RegistrationsController
  before_action :set_update, only: [:show, :edit, :update, :destroy]

  # GET /user
  def index
    @user = User.all
  end

  # GET /user/1
  def show
  end

  # GET /user/new
  def new
    @user = User.new
  end

  # GET /user/1/edit
  def edit
  end

  # POST /user
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /user/1
  def user
    if @user.user(user_params)
      redirect_to @user, notice: 'User was successfully userd.'
    else
      render action: 'edit'
    end
  end

  # DELETE /user/1
  def destroy
    @user.destroy
    redirect_to user_url, notice: 'User was successfully destroyed.'
  end

  def home
    if logged_in?


    else
      render action: 


    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :username, :bio, :avatar, :email, :role, :password, :password_confirmation)
    end
end
