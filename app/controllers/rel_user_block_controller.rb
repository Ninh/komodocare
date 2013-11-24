class RelUserBlockController < ApplicationController
	def create
		@block = Block.find(params[:rel_user_course][:course_id])
		current_user.register!(@block)
		respond_to do |format|
			format.html { redirect_to courses_path }
			format.js
		end
	end

	def destroy
		@course = RelUserCourses.find(params[:id]).course
		current_user.drop!(@course)
		respond_to do |format|
			format.html { redirect_to courses_path }
			format.js
		end
	end
end
