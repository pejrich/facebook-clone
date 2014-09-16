class CommentsController < ApplicationController

	def create
		@comment = current_user.comments.build(comment_params)
		if @comment.save
			flash[:success] = "Comment posted"
			redirect_to post_path(comment_params[:post_id])
		end
	end

	private

		def comment_params
			params.require(:comment).permit(:content, :post_id)
		end
end
