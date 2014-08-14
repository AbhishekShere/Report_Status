class UsersSessionsController < ApplicationController
   prepend_before_filter :verify_signed_out_user, only: :destroy

	def create
	end
	
	def new
	end
	
	def destroy
		signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
		set_flash_message :notice, :signed_out if signed_out && is_flashing_format?
		yield if block_given?
		respond_to_on_destroy
	end
	
	private
	def verify_signed_out_user
		if all_signed_out?
		set_flash_message :notice, :already_signed_out if is_flashing_format?
		respond_to_on_destroy
	end
	end
  	
end
