class MailUsersController < InheritedResources::Base
	def new
  	@mail_user = MailUser.new
	end
	
	def create
    @mail_user = MailUser.new(mail_user_param)
 
    respond_to do |format|
      if @mail_user.save
        # Tell the UserMailer to send a welcome email after save
        UserMailer.welcome_email(@mail_user).deliver
 
        format.html { redirect_to(@mail_user, notice: 'User was successfully created.') }
        format.json { render json: @mail_user, status: :created, location: @mail_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @mail_user.errors, status: :unprocessable_entity }
      end
    end
  end
  private
  def mail_user_param
   		params.require(:mail_user).permit(:name, :email, :login)
  end	
end
