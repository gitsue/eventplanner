Rails.application.routes.draw do

  get 'events/', to: 'activities#index'
  get 'logout/', to: 'session#logout'
  get 'user/', to: 'users#show'
  get 'events/:id/', to: 'activities#show'
  get 'events/:id/edit', to: 'activities#edit'
  get 'register/', to: 'session#register_page'
  get 'login/', to: 'session#login_page'
  post 'register/', to: 'session#register'
  post 'login/', to: 'session#login'
  post 'addevent/', to: 'activities#create'
  post 'join/:id', to: 'attendees#join'
  post 'addcomment/:id', to: 'comments#add'
  post 'user/', to: 'users#update'
  post 'event/edit/:id', to: 'activities#update'
  root 'session#index'
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
