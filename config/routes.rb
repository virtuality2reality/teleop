Teleop::Application.routes.draw do

  devise_for :users

  resources :clients do
    resources :surveys do
      resources :calls
    end
  end
  
  root :to => "clients#index"
  
end
