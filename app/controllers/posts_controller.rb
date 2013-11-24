class PostsController < ApplicationController
  
  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      redirect_to :back, :flash => { :success => "Post created!" }
    else
    #  @feed_items = []
      render 'pages/home'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, :flash => { :success => "Post deleted!" }
  end
  
  private
  
    def authorized_user
      @post = current_user.posts.find_by_id(params[:id])
      redirect_to root_path if @post.nil?
    end
end
