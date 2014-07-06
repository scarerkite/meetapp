class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # def index
  #   @comments = Comment.all
  # end

  # GET /comments/1
  # def show
  # end

  # GET /comments/new
  # def new
  #   @comment = Comment.new
  # end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  def create
    authorize! :create, Comment
    @event = Event.find(params[:event_id])
    @comment = @event.comments.build comment_params
    @comment.user = current_user
    @comment.save!


    if @comment.save
      redirect_to @event, notice: 'Update was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /comments/1
  # def update
  #   if @comment.update(comment_params)
  #     redirect_to @event, notice: 'Update was successfully updated.'
  #   else
  #     render action: 'edit'
  #   end
  # end

  # DELETE /comments/1
  def destroy
    authorize! :destroy, @comment
    @comment.destroy
    redirect_to @event, notice: 'Update was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @event = Event.find(params[:event_id])
      @comment = @event.comments.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:body)
    end
end
