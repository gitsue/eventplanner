class CommentsController < ApplicationController
	def add
		Comment.create(content: params[:content], user_id: session[:user_id], activity_id: params[:id])
		redirect_to "/events/#{params[:id]}/"
	end
end