class FriendshipsController < ApplicationController

	def create
		@friendship = current_user.friendships.build(:friend_id => params[:friend_id])
		if @friendship.save 
			flash[:success] = "Successfully create friendship."
			redirect_to root_url
		else
			render :action => 'new'
		end
	end

	def destroy
		@friendship = Friendship.find(params[:id])
		@friendship2 = Friendship.where(:friend_id => current_user.id, )
		@friendship.destroy
		flash[:notice] = "Successfully destoyed friendship."
		redirect_to root_url
	end
end
