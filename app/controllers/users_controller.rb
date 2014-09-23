class UsersController < ApplicationController

before_filter :authenticate_user!

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@post = Post.new
		@comment = Comment.new
		@notifications = current_user.notifications
		@search_results = User.search(params[:search])
		respond_to do |format|
			format.html 
			format.json {render :json => @user}
		end
	end

	def edit
		@user = User.find(params[:id])
		if current_user != @user
			flash[:error] = "You can't edit this users profile!"
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def update
		@user = User.update(params[:id], user_params)
		current_profile_photo = @user.profile_photo
		@profile_photo = Photo.new(profile_photo_params)
		if @profile_photo.save
			if current_profile_photo
				current_profile_photo.profile_photo = false
				current_profile_photo.save
			end
		end
		if @user.save
			redirect_to @user
		else
			render 'edit'
		end
	end


	private

		def user_params
			params.require(:user).permit(:job_title, :company, :job_title,
										:current_city, :home_town, :in_a_relationship, :first_name, :last_name)
		end

		def profile_photo_params
			params.require(:user).permit(:photo).merge(:user_id => @user.id, :profile_photo => true)
		end

		# def cover_photo_params
		# 	params.require(:user).permit(:cover_photo)
		# end

end
