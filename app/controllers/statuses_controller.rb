class StatusesController < ApplicationController
before_action :require_login
 
  def create
  	#render plain: params[:status].inspect
  	  @status = current_user.statuses.create(status_params)
 		 	@status.save
  	redirect_to @status
  end

	def show
		@status = Status.find(params[:id])
	end

  def status_params
     	params.require(:status).permit(:subject, :intime, :outtime, :breaktime, 
 		:meetingtime, :workinghours,:coordinate, :text)
  end
  
end