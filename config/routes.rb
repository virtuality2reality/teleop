Teleop::Application.routes.draw do

  resources :clients do
    resources :surveys do
      resources :calls
    end
  end
  
  root :to => "clients#index"
  
end
