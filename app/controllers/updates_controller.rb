class UpdatesController < ApplicationController
  before_action :set_update, only: [:show, :edit, :update, :destroy]

  # GET /updates
  def index
    @updates = @event.updates
  end

  # GET /updates/1
  def show
  end

  # GET /updates/new
  def new
    # @event = Event.find(params[:event_id])
    @update = Update.new(update_params)
  end

  # GET /updates/1/edit
  def edit
  end

  # POST /updates
  def create
    @event = Event.find(params[:event_id])
    @update = @event.updates.build(params[:update])
    @update.user = current_user
    @update.save

   

    if @update.save
      redirect_to @event, notice: 'Update was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /updates/1
  def update
    if @update.update(update_params)
      redirect_to @update, notice: 'Update was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /updates/1
  def destroy
    @update.destroy
    redirect_to updates_url, notice: 'Update was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_update
      @update = Update.find(params[:id])
    end

    def set_event
      @event = Event.find(params[:event_id])
    end

    # Only allow a trusted parameter "white list" through.
    def update_params
      params.require(:update).permit(:event_id, :user_id, :body, :event)
    end
end
