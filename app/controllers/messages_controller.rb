class MessagesController < ApplicationController
  def index
    @commentable = find_commentable
    @messages = @commentable.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @parent_id = params.delete(:parent_id)
    @commentable = find_commentable
    @message = Message.new( :parent_id => @parent_id, 
                            :commentable_id => @commentable.id,
                            :commentable_type => @commentable.class.to_s)

    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.json { render json: @message }
    #end
  end
  
  def create
    @commentable = find_commentable
    @message = @commentable.messages.build(params[:message])
    if @message.save
      flash[:notice] = "Successfully created comment."
      redirect_to :id => nil#@commentable
    else
      flash[:error] = "Error adding comment."
    end
  end

  private
    def find_commentable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end
end
