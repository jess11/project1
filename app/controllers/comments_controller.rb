class CommentsController < ApplicationController
  def index
    @user = @current_user
    @post = Post.find params[:post_id]
    @user_post = @post.user
    @comment = Comment.new
    render :index, :layout => false
  end

  def create
    @post = Post.find params[:post_id]
    @comment = @post.comments.new comment_params
    @comment.user_id = @current_user.id
    if @comment.save
      redirect_to request.referrer || root_path
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to post_comments_path
  end

  private
  def comment_params
      params.require(:comment).permit(:message, :user_id)
  end



end
