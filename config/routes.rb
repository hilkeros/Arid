ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => "posts"

  map.namespace :admin do |admin|
    admin.resources :posts
    admin.resources :gigs
    admin.resources :users
    admin.root :controller => "posts"
    admin.resources :comments
    admin.resources :songs
    admin.resources :products
    admin.resources :orders
    admin.resources :videos
    admin.resources :photos
    admin.order_paid      '/order/:id/paid',  :controller => 'orders', :action => 'update', :order => { :state => "paid"}
    admin.order_sent      '/order/:id/sent',  :controller => 'orders', :action => 'update', :order => { :state => "sent"}
    admin.archived_orders '/orders/filter/archived', :controller => 'orders', :action => 'index', :filter => 'archived'
  end
  
  map.resources :posts, :as => "news" do |post|
    post.resources :comments
  end
  
  map.resource :user_session
  map.resource :account, :controller => "users"
  map.resource :user do |usr|
    usr.resource :fav_songs
  end
  map.resources :gigs do |gig|
    gig.resources :photos
    gig.resources :comments
  end
  map.resources :mailing_addresses
  map.resources :password_resets
  map.resources :press
  map.resource :language
  map.resources :products
  map.resource :order, :member => {:confirmed => :get}
  map.resource :billing_addresses
  map.resource :shipping_addresses
  map.resources :order_products
  map.resources :friendships
  map.resources :comments
  map.resources :shouts
  map.resources :videos
  map.resources :photos
  
  map.profile '/fans/:id', :controller => 'users', :action => 'show'
  
  map.resources :users, :as => 'fans' do |usr|
    usr.resources :users, :as => 'friends'
    usr.resources :photos, :has_many => :comments
  end
    
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
