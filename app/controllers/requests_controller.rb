class RequestsController < ApplicationController
	before_filter :authenticate_user!

	def create
		@request = current_user.sent_requests.build(request_params)
		@request.save
		@recipient = User.find(request_params[:recipient_id])
		@notification = @recipient.notifications.build(:message => "Friend Request from " + current_user.name,
													 :sender_id => current_user.id, 
													 :friend_request? => true,
													 :request_id => @request.id)
		@notification.save
		flash[:success] = @recipient.name + " requested as a friend!"
		redirect_to @recipient
	end

	private

		def request_params
			params.permit(:recipient_id)
		end
end

