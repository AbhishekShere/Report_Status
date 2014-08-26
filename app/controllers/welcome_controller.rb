class WelcomeController < ApplicationController
 
  def index
  end

  def edit_profile
  end

  def update_edit_profile
  		current_user.update(user_detail_params)
    	flash[:notice] = "Profile has been Updated succesfully."
  		redirect_to users_home_path
  end

  def users_profile
  end

  private
  def user_detail_params
     	params.require(:user).permit(:fname, :lname, :dob)
  end
end
 