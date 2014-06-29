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
    @update = User.new
  end

  # GET /user/1/edit
  def edit
  end

  # POST /user
  def create
    @update = User.new(update_params)

    if @update.save
      redirect_to @update, notice: 'User was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /user/1
  def update
    if @update.update(update_params)
      redirect_to @update, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /user/1
  def destroy
    @update.destroy
    redirect_to user_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_update
      @update = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def update_params
      params.require(:update).permit(:event_id, :user_id, :body)
    end
end
