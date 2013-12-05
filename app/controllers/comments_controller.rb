class CommentsController < ApplicationController
	def index
		@event = Event.find(params[:event_id])
		@commentable = find_commentable
		@comments = @commentable.comments
		@commenter = User.find(1)
		user = User.find(params[:user_id])
	end

	def show
		@comment = Comment.find(params[:id])
		user = User.find(params[@comment.user_id])
	end

	def new
		#user = User.find(params[:user_id])
		@comment = Comment.new
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		flash[:notice] = "Deleted comment."
		redirect_to :back
	end

	def create
		@commentable = find_commentable
		@comment = @commentable.comments.build(params[:comment].merge(:user_id => current_user.id))
		#@comment.user = User.find(1)
		#@comment = current_user.comments.build(params[:comment])
		@comment.save!
		if @comment.save
			flash[:notice] = "Comment created!"
			redirect_to :back
			#redirect_to :id => nil
		else
			render :action => 'new'
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
