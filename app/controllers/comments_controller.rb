class CommentsController < ApplicationController

  before_action :signed_in_user

  def index
    @comments = Comment.all
  end

  def create
    @shift = Shift.find(params[:shift_id])
    @comment = @shift.comments.build(comment_params.merge(user_id: current_user.id))
    respond_to do |format|

      if @comment.save
        format.html { redirect_to @shift, success: 'Comment created !' }
        format.js
      else
        format.html { render :index }
        format.js 
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end

end
