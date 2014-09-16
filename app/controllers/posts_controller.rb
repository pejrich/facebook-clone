class PostsController < ApplicationController

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			flash[:success] = "Post created."
			redirect_to @post
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
			params.require(:post).permit(:title, :content, :author_id)
		end
end
