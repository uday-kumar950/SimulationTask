Rails.application.routes.draw do
  resources :blind_dates
  resources :employees
  resources :teams


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "employees#index"
end
