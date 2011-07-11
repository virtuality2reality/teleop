Teleop::Application.routes.draw do

  devise_for :users

  resources :clients do
    resources :surveys do
      resources :calls
      member do
        get 'dependencies/edit' => "dependencies#edit", :as => "edit_dependencies"
        put 'dependencies/update' => "dependencies#update", :as => "update_dependencies"
      end
    end
  end
  
  root :to => "clients#index"
  
end
