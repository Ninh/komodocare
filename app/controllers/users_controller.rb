class UsersController < ApplicationController
	def index
		@users = User.paginate(page: params[:page])
	end

	def show
		@user = User.find(params[:id])
		@events = @user.events.paginate(:page => params[:page])
	end

	def edit
		@user = User.find(params[:id])
	end

	def register
	end

	def new
		@user = User.new
	end

	def remove_avatar
		@user = User.find(params[:id])
		@user.avatar.destroy
		@user.save
		redirect_to @user
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:success] = "User added"
			redirect_to users_path
		else
			render 'new'
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			flash[:success] = "Profile updated"
			sign_in @user
			#redirect_back
			
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User destroyed."
		redirect_to users_url
	end

	private

		def admin_user
			redirect_to(home_path) unless current_user.admin?
		end

		def signed_in_user
			unless signed_in?
				store_location
				redirect_to signin_url, notice: "Please sign in."
			end
		end

		def correct_user
			@user = User.find(params[:id])
			redirect_to(home_path) unless current_user?(@user)
		end
end
