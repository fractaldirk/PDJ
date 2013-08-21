Party::Application.routes.draw do

  get "admin/statistics"
  get "admin/top_users"
  get "admin/statisticz"

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :promotions

  resources :paintings

  get "home/testy" => 'home#testy'
  get "home/pizza" => 'home#pizza'
  get "home/activity" => 'home#activity'
  get "home/reload" => 'home#reload'
  get "home/reloadlatestsongs" => 'home#reload_latest_songs'
  get "home/reloadtopsongs" => 'home#reload_top_songs'
  get "home/reloadlatestpromotions" => 'home#reload_promotions'
  get "home/marquee" => 'home#marquee'
  get "home/index"
  get "dj" => 'home#dj'
  get "live" => 'home#dashboard'
  get "home/dashboard" => 'home#dashboard'
  get "home/privacy" => 'home#privacy'
  get "home/terms" => 'home#terms'
  get "home/support" => 'home#support'
  get "home/help" => 'home#login_helper'
  get "home/about" => 'home#about'

  match 'auth/:provider/callback', to: 'sessions#create'
  match "/auth/failure" => redirect("/")
  match 'signout', to: 'sessions#destroy', as: 'signout'

  get 'songs/gettrack' => 'songs#gettrack'
  get 'songs/gettracky' => 'songs#gettracky'
  get 'songs/gettrackyy' => 'songs#gettrackyy'
  get 'songs/tracklist' => 'songs#tracklist'
  get 'songs/add' => 'songs#add'
  get 'songs/all_songs' => 'songs#all_songs'

  #playlists of songs controller
  get 'songs/playlists' => 'songs#playlists'
  get 'songs/pop-rock' => 'songs#poprock'
  get 'songs/rock' => 'songs#rock'
  get 'songs/indie' => 'songs#indie'

  resources :songs do
    member { post :vote }
    member { get :promote }
    member { get :edit_gettrack }
    member { get :new_promotion }
  end

  resources :lists

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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
