class CommentsController < ApplicationController

  def create
    commentable_id = params[:user_id]
    comment_params[:commentable_id] = commentable_id
    if comment = Comment.create(comment_params)
      render json: comment
    else
      render(
      json: comment.errors.full_messages, status: :unprocessable_entity
      )
    end
  end



  private
  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
end
