class LikesController < ApplicationController
	before_filter :authenticate_user!

	def create
		@like = current_user.likes.build(like_params)
		if @like.save
			flash[:success] = "Post liked"
			post = Post.find(like_params[:post_id])
			if post.author != current_user
				post.author.notifications.build(:message => "#{current_user.name} liked your post on #{post.wall.user.name}'s wall",
												:sender_id => current_user.id).save
			end
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
