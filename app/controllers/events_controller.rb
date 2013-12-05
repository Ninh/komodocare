class EventsController < ApplicationController
    include FilmFan::Commentable

  	def new
  		@event = Event.new
  	end

    def index
      @user = User.find(params[:user_id])
      #@events = user.events.paginate(page: params[:page])
      @events = @user.events
     # user = User.find(1)
      
    end

  	def show
  		@event = Event.find(params[:id])

      #user = User.find(params[@comment.user_id])
  	end
  
  def create
    @event = current_user.events.build(params[:event])
    if @event.save
      #redirect_to root_path, :flash => { :success => "Medical event created!" }
      redirect_to :back
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def delete
     @event.destroy
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to :back, :flash => { :success => "Medical event deleted!" }
  end
  
  private
  
    def authorized_user
      @event = current_user.events.find_by_id(params[:id])
      redirect_to root_path if @event.nil?
    end
end
