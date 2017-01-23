class LikesController < ApplicationController

  def update
    @post = Post.find(params[:post_id])
    @post.increment_counter(:likes)
    redirect_to root_path
  end


end
