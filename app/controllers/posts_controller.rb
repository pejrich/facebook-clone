class PostsController < ApplicationController
	before_filter :authenticate_user!

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			flash[:success] = "Post created."
			if @post.wall.user != current_user
				@post.wall.user.notifications.build(:sender_id => current_user.id,
													:message => "#{current_user.name} posted on your wall.").save
			end
			redirect_to @post.wall.user
		else
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
		@likers = @post.likers.map(&:name)
		@comment = Comment.new
	end


	private

		def post_params
			params.require(:post).permit(:title, :content, :author_id, :wall_id)
		end
end
