class RequestsController < ApplicationController

	def create
		@request = User.find(current_user.id).sent_requests.build(request_params)
		@request.save
		@recipient = User.find(request_params[:recipient_id])
		flash[:success] = @recipient.name + " requested as a friend!"
		redirect_to users_path
	end

	private

		def request_params
			params.permit(:recipient_id)
		end
end

