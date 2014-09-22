class LikesController < ApplicationController
	before_filter :authenticate_user!

	def create
		@like = current_user.likes.build(like_params)
		if @like.save
			flash[:success] = "Post liked"
			redirect_to :back
		end
	end

	def destroy
		@like = Like.find(params[:id]).destroy
		flash[:success] = "Post unliked"
		redirect_to :back
	end

	private

		def like_params
			params.permit(:post_id)
		end


end
