module PostsHelper

	def liked?(post)
		if current_user.liked_posts.map(&:id).include? post.id
			return true
		else
			return false
		end
	end
end
