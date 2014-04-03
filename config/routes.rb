TaskManager::Application.routes.draw do
  resources :goals

  resources :habits

  resources :tasks

  devise_for :users
  root "pages#home"
  get "goals" => "goals#index"
  get "tasks" => "tasks#index"
  get "habits" => "habits#index"

  # Add routes for creating new daily, weekly, and monthly habits
  get "new_dailyhabit" => "habits#newdaily"
  get "new_weeklyhabit" => "habits#newweekly"  
  get "new_monthlyhabit" => "habits#newmonthly"

  get "progress_up_action" => "tasks#progress_up_action" 
  get "progress_down_action" => "tasks#progress_down_action"  
  get "toggle_habit" => "habits#toggle_action"   
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
