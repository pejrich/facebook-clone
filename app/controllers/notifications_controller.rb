class NotificationsController < ApplicationController

	def destroy
		notification = Notification.find(params[:notification_id])
		if notification.friend_request? && (params[:accepted] == "1")
			request = Request.find(notification.request_id)
			friendship = request.sender.friendships.build(:friend_id => request.recipient.id)
			friendship2 = request.recipient.friendships.build(:friend_id => request.sender.id)
			if friendship.save && friendship2.save
				flash[:success] = "Friendship Sucresssfull"
				notification.destroy
				redirect_to request.recipient
			else
				flash[:error] = "not" + friendship.errors.full_message
				redirect_to current_user
			end	
		elsif (notification.friend_request? && (params[:accepted] == "0"))
			Request.find(notification.request_id).destroy
			notification.destroy
			redirect_to current_user
		else
			notification.destroy
			redirect_to current_user
		end
					
	end

	private

		def notification_params
			params.permit(:notification_id)
		end
end
