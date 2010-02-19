ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  map.namespace :admin do |admin|
    admin.resources :posts
    admin.resources :gigs
    admin.resources :users
    admin.root :controller => "posts"
    admin.resources :comments
    admin.resources :songs
    admin.resources :products
  end
  
  map.resources :posts, :as => "news" do |post|
    post.resources :comments
  end
  map.root :controller => "posts"
  
  map.resource :user_session
  map.resource :account, :controller => "users"
  map.resource :user do |usr|
    usr.resource :fav_songs
  end
  map.resources :gigs
  map.resources :mailing_addresses
  map.resources :password_resets
  map.resources :press
  map.resource  :language
  map.resources  :products
  map.resource :order
  
  map.profile '/fans/:id', :controller => 'users', :action => 'show'
    
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login  '/login',  :controller => 'user_sessions', :action => 'new'
  map.logout  '/logout',  :controller => 'user_sessions', :action => 'destroy'
  map.contact '/contact', :controller => 'pages', :action => 'contact'
  map.updates '/updates', :controller => 'pages', :action => 'updates'
  
  # map.root :controller => "user_sessions", :action => "new" # optional, this just sets the root route
  

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
