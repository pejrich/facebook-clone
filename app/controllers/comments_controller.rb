class CommentsController < ApplicationController
	before_filter :authenticate_user!

	def create
		puts "\n\n\n\n\n\n\n\n #{comment_params} \n\n\n\n\n\n\n\n\n"
		@comment = current_user.comments.build(comment_params)
		if @comment.save
			flash[:success] = "Comment posted"
			redirect_to user_path(params[:id])
		end
	end

	private

		def comment_params
			params.require(:comment).permit(:content, :commentable_id, :commentable_type)
		end

		def find_commentable
			params.each do |name, value|
				if name =~ /(.+)_id$/
					return $1.classify.constantize.find(value)
				end
			end
			nil
		end
end
