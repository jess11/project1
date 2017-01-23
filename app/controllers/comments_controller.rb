class CommentsController < ApplicationController
  def index
    @user = @current_user
    @post = Post.find params[:post_id]
    @comment = Comment.new
    render :index
  end

  def create
    @post = Post.find params[:post_id]
    @comment = @posts.comments.new comment_params
    if @comment.save
          redirect_to post_comments_path
    else
      render post_comments_path
    end

  end

  private
  def comment_params
      params.require(:comment).permit(:message, :user_id)
  end



end
