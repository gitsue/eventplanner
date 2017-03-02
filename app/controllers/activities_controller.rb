class ActivitiesController < ApplicationController
  def index
  	#User.where(state:"WA").first.activities.first.location
  	#User.where.not(state:"WA")
  	@user = User.where(id: session[:user_id]).first
  	@user_events = Activity.where(location: @user.location)
  	@other_events = Activity.where.not(location: @user.location)
  	render "index"
  end

  def create
  	@user = User.where(id: session[:user_id]).first
  	@event = Activity.new(name: params[:name], location: params[:location], date: params[:date], user: @user)
  	if @event.save
  		redirect_to "/events/"
  	else
  		flash[:event_errors] = @event.errors.full_messages
  		redirect_to "/events/"
  	end
  end

  def show
  	@event = Activity.where(id: params[:id]).first
  	@comments = Activity.where(id: params[:id]).first.comments
  	render "show"
  end

  def logout
  	redirect_to "/logout/"
  end
  
  def edit
  	@event = Activity.where(id: params[:id]).first
  	render "edit"
  end

  def update
    @event_id = Activity.where(id: params[:id]).first
  	@event = Activity.where(id: params[:id]).first.update(name: params[:name], location: params[:location], date: params[:date])
    if @event
      redirect_to "/events/"
    else
      flash[:update_errors] = "An error occurred, event was not updated."
      redirect_to :back
    end
  end

  def delete

  end

end
