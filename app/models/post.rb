class Post < ActiveRecord::Base
	has_many :comments
	has_many :likes
	has_many :likers, :through => :likes, :source => :user
	belongs_to :author, :class_name => "User"
	belongs_to :wall

	# returns posts by date
	default_scope { order("created_at DESC")}

	def liked?(post)
		if current_user.liked_posts.map(&:id).include? post.id
			return true
		else
			return false
		end
	end

	def like_id(post)
		like = Like.find_by_post_id_and_user_id(post.id, current_user.id)
	end
end
