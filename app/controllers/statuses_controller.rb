class StatusesController < ApplicationController
  before_action :require_login

  def index
    @user = current_user
    @status=@user.statuses
  end
    
  def create
  	@status = current_user.statuses.create(status_params)
 		@status.save
  	redirect_to @status
  end

	def show
		@status = Status.find(params[:id])
	end

  def status_params
    params.require(:status).permit(:subject, :date, :intime, :outtime, :breaktime, 
 		:meetingtime, :workinghours,:coordinate, :text)
  end
end
