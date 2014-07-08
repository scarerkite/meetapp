class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :edit, :update, :destroy]

  # GET /invitations
  def index
    @invitations = Invitation.all
  end

  # GET /invitations/1
  def show
  end

  # GET /invitations/new
  def new
    @invitation = Invitation.new
  end

  def accept_invitation
    invitation = Invitation.find(params[:id])
    invitation.accepted = true
    invitation.save!
    redirect_to :back
  end

  def decline_invitation
    invitation = Invitation.find(params[:id])
    invitation.accepted = false
    invitation.save!
    redirect_to :back
  end

  # GET /invitations/1/edit
  def edit
  end

  # POST /invitations
  def create
    @event = Event.find(params[:event_id])
    @invitation = @event.invitations.build invitation_params
    @invitation.host_id = current_user

    if @invitation.save
      redirect_to @invitation, notice: 'Invitation was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /invitations/1
  def update
    if @invitation.update(invitation_params)
      redirect_to @invitation, notice: 'Invitation was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /invitations/1
  def destroy
    @invitation.destroy
    redirect_to invitations_url, notice: 'Invitation was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invitation
      @invitation = Invitation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def invitation_params
      params.require(:invitation).permit(:invitee)
    end
end
