Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  get "about", to: "pages#about"
  resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destory]
  get "signup", to: 'users#new'
  resources :users, except: [:new]
  get "login", to: 'sessions#new'
  post "login", to: 'sessions#create'
  delete "login", to: 'sessions#destroy'

end
