class UsersController < ApplicationController
  def show
  	@user = User.where(id: session[:user_id]).first
  	render "show"
  end

  def update
  	@user = User.where(id: session[:user_id]).first
  	update = @user.update(fname: params[:fname], lname: params[:lname], email: params[:email], location: params[:location], state: params[:state])
  	if update
  		redirect_to "/events/"
  	else
  		flash[:notice] = ["Update not successful!"]
  		redirect_to "/user/"
  	end
  end
end
