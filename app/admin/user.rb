ActiveAdmin.register User do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  

 	index do
        selectable_column
    id_column
    column :email
    column :fname
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
    column "Status_List" do |user|
      link_to 'status', status_list_admin_user_path(user)
    end
  end
  filter :email
  filter :fname
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

action_item do
  link_to 'Invite New User', new_invitation_admin_users_path
end
 
collection_action :new_invitation do
  @user = User.new
end
 
collection_action :send_invitation, :method => :post do
  @user = User.invite!(params[:user])
if @user.errors.empty?
  flash[:success] = "User has been successfully invited."
  redirect_to admin_users_path
else
  messages = @user.errors.full_messages.map { |msg| msg }.join
  flash[:error] = "Error: " + messages
 redirect_to new_invitation_admin_users_path
end
end

member_action :status_list do
  @user = User.find(params[:id])
  @status=@user.statuses
end

end
