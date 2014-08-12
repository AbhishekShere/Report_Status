Rails.application.routes.draw do
  get 'welcome/index'
	root 'welcome#index'

  get 'users_home', to: 'welcome#users_home'

  get 'profile_edit', to: 'welcome#edit_profile'
  post 'post_profile_edit', to: 'welcome#update_edit_profile'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :statuses
  resources :mail_users

  devise_for :users,
	:controllers => {
	#:sessions => "users_sessions_controller",
	#:registrations => "devise_update/update",
	:passwords => "user_passwords",
	# Proper invitations should be sent through the active_admin interface.
	:invitations => 'users_invitations' # user_invitations_controller.rb
	}, :skip => [:registrations]
 as :user do
   get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
   put 'users' => 'devise/registrations#update', :as => 'user_registration'
end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
