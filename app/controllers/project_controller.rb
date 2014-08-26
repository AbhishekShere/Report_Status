class ProjectController < ApplicationController
	 before_action :require_login

  def index
    @user = current_user
    @project=@user.projects
  end
    
  def create
  	@project = current_user.projects.create(project_params)
 		@project.save
  	redirect_to @project
  end

	def show
		@project = Project.find(params[:id])
	end

  def project_params
    params.require(:status).permit( :projectname, :clientname, :pworkinghours, :taskdo)
  end
end
