class BlockController < ApplicationController
	before_filter :authenticate
  	before_filter :authorized_user, :only => :destroy
  
  def create
    @block = current_user.blocks.build(params[:block])
    if @block.save
      redirect_to root_path, :flash => { :success => "Medical event created!" }
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @block.destroy
    redirect_to root_path, :flash => { :success => "Medical event deleted!" }
  end
  
  private
  
    def authorized_user
      @block = current_user.blocks.find_by_id(params[:id])
      redirect_to root_path if @block.nil?
    end
end
