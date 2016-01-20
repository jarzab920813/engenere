Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  devise_scope :user do
    get "/login" => "devise/sessions#new"
  end

  resources :vehicles do
  	#collection ścieżki do których nie przesyłamy id
    collection do 
    end
    #member  ścieżki do który przesyłamy id
    member do
      get 'index/vehicels/:id' => 'vehicles#index'
    end 
  end

  resources :fleets do
    #collection ścieżki do których nie przesyłamy id
    collection do 
      post :save_fleets
    end
    #member  ścieżki do który przesyłamy id
    member do
      get 'index/fleets/:id' => 'fleets#index'
    end 
  end

  resources :documents do 
  	collection do 
    end
  	member do

    end 

	end
	resources :events do 
  	collection do 
    end
  	member do
      get :new_similar
    end 

	end


  get "/download_file/:id(/:name)" => "documents#download_file", :as => :download_file

  get 'dashboard/time_to_terminate' => 'dashboards#time_to_terminate', :as => :time_to_terminate
  # do
  #   collection do 
  #     post :create
  #   end
  #   member do
  #     get :download
  #   end
  # end

  # You can have the root of your site routed with "root"
  root 'dashboard#index'


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
