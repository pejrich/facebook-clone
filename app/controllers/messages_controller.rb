class MessagesController < ApplicationController

	def new
		@message = Message.new
	end

	def create
		@message = Message.create(message_params)
		redirect_to message_path(@message.id)
	end

	def show
		@message = Message.find(params[:id])
	end

	private

		def message_params
			params.require(:message).permit(:sender_id, :recipient_id, :content)
		end
end
