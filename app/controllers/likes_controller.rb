class LikesController < ApplicationController

  def update
    @post = Post.find(params[:post_id])
    Post.increment_counter(:likes,params[:post_id])
    redirect_to request.referrer || root_path
  end


end