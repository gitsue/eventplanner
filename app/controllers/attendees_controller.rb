class AttendeesController < ApplicationController
	def join
		Attendee.create(user_id: session[:user_id], activity_id: params[:id]) 
		redirect_to "/events/"
	end 
end