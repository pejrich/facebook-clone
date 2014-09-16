module ApplicationHelper

	def like_id(post)
		like = Like.find_by_post_id_and_user_id(post.id, current_user.id)
	end
end
