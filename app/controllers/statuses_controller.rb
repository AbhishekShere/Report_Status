class StatusesController < ApplicationController
before_action :require_login
 
  def create
  	#render plain: params[:status].inspect
  	  @status = Status.new(status_params)
 		 	@status.save
  	redirect_to @status
  end

	def show
		@status = Status.find(params[:id])
	end

  def status_params
     	params.require(:status).permit(:user_id, :subject, :intime, :outtime, :breaktime, 
 		:meetingtime, :workinghours, :projectname, :clientname, :workinghours, :taskdo, :coordinate, :text)
  end
 
  private
  def require_login
    unless user_signed_in?
      flash[:notice] = "You must be logged in to access Status."
      redirect_to new_user_session_path # halts request cycle
    end
  end
 
end