Fdimproved::Application.routes.draw do

  root :to => 'sessions#new'
  
  resources :sessions
  match '/signin',  to: 'sessions#new', :as=>:signin  
  match '/signout',  to: 'sessions#destroy', :as=>:signout  
  
  resources :users
  match '/signup',  to: 'users#new', :as=>:signup    
  match '/cus_create',  to: 'users#create', :as=>:create   
  match '/get_info_from',  to: 'users#get_info_from', :as=>:get_info_from  
  match '/get_to_reply',  to: 'users#get_to_reply', :as=>:get_to_reply 
  match '/reply_to_customer',  to: 'users#reply_to_customer', :as=>:reply_to_customer     

  resources :cases
  match '/case_new',  to: 'cases#new', :as=>:case_new  
  match '/case_create',  to: 'cases#create', :as=>:case_create    
  match '/case_show',  to: 'cases#show', :as=>:case_show 
  match '/case_detail',  to: 'cases#detail', :as=>:case_detail   
  
  resources :processings
  match '/create_response',  to: 'processings#create_response', :as=>:create_response   
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
