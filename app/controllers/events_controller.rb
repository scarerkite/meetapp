class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  def index
    redirect_to profile_path
  end

  # GET /events/1
  def show
    authorize! :read, @event
  end

  # GET /events/new
  def new
    @event = Event.new
    authorize! :new, @event
  end

  # GET /events/1/edit
  def edit
    authorize! :edit, @event
  end

  # POST /events
  def create
    @event = Event.new(event_params)
    @event.host = current_user
    @event.cancelled = false
    authorize! :create, @event
    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /events/1
  def update
    # authorize! :update, @event 
    respond_to do |format|
      if @event.update_attributes(event_params)
        format.html { redirect_to @event, notice: 'Post was successfully updated.' }
        format.json { render json: @event, status: :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    authorize! :destroy, @event
    redirect_to profile_path, notice: 'Event was successfully destroyed.'
  end

  def cancel
    event = Event.find(params[:id])
    event.cancelled = true
    authorize! :cancel, event
    event.save!
    redirect_to :profile
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:id, :title, :description, :address, :time, :date, :postcode, :comment, :latitude, :longitude, {invitations_attributes:[:invitee_id]})
    end
end
