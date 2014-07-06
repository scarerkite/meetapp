class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  def index
    @hosted_events = current_user.hosted_events
    @invited_events = current_user.events
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
    authorize! :create, @event
    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /events/1
  def update
    authorize! :update, @event
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    authorize! :destroy, @event
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:title, :description, :address, :time, :date, :postcode, :comment, :latitude, :longitude, {invitations_attributes:[:invitee_id]})
    end
end
