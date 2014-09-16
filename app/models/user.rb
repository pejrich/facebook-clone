class User < ActiveRecord::Base
	# For friend requests
	has_many :sent_requests, :foreign_key => :sender_id, :class_name => "Request"
	has_many :recieved_requests, :foreign_key => :recipient_id, :class_name => "Request"
	# For post likes
	has_many :likes
	has_many :liked_posts, :through => :likes, :source => :post

	has_many :posts, :foreign_key => :author_id
	has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
