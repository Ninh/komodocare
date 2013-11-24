class CommentsController < ApplicationController
	def index
		@commentable = find_commentable
		@comments = @commentable.comments
	end

	def show
		@comment = Comment.find(params[:id])
	end

	def new
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
		@comment = @commentable.comments.build(params[:comment])
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
