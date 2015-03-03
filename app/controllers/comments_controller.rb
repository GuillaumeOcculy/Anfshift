class CommentsController < ApplicationController

  before_action :signed_in_user
  
  def index
    @comments = Comment.all
  end

  def create
    @shift = Shift.find(params[:shift_id])
    @comment = @shift.comments.create(comment_params.merge(user_id: current_user.id))
    redirect_to @shift, success: 'Comment created !'
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end

end
