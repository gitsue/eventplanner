class SessionController < ApplicationController
  def index
  	#Show register and login page
  	#Successful registration and login should route to event dashboard
    @events = Activity.limit(10)
  	render "index"
  end

  def register_page
    render "register"
  end

  def register
  	@user = User.new(user_params)
  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to "/events/"
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to "/"
  	end 
  end

  def login_page
    render "login"
  end

  def login
  	@user = User.where(email: params[:email]).first
  	if @user && @user.authenticate(params[:password])
  		session[:user_id] = @user.id
  		redirect_to "/events/"
  	else
  		flash[:notice] = ["Invalid email/password combination"]
  		redirect_to "/"
  	end
  end 

  def logout
  	reset_session
  	redirect_to "/"
  end 

  private
  def user_params
  	params.require(:user).permit(:fname, :lname, :location, :state, :email, :password)
  end

end
