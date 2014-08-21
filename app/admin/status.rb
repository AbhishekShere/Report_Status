ActiveAdmin.register Status do
  
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
    column "User_id" do |status|
      link_to status.user.fname, admin_user_path(status.user)
    end
    column :subject
    column :date
    column :intime  
    column :outtime 
    column :breaktime
    column :meetingtime
    column :workinghours
    column :coordinate
    column :text
    
 end
  filter :id
  filter :subject
  filter :date
  filter :intime
  filter :outtime
  filter :breaktime
  filter :meetingtime
  filter :workinghours
  filter :coordinate
  filter :text
  
  def index
    @user = User.find(params[:id])
    @statuses=@user.status
    respond_to do |format|
    respond_to :xls, :html, :csv
      format.html
      format.csv { render text: @statuses.to_csv }
      format.xml
    end
  end
end
