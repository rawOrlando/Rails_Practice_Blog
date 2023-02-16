Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  get "about", to: "pages#about"
  resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  # destroy not working right so adding this routing work around
  get "destroy_article", to: 'articles#destroyish'
  get "signup", to: 'users#new'
  resources :users, except: [:new]
  get "destroy_user", to: 'users#destroyish'
  get "login", to: 'sessions#new'
  post "login", to: 'sessions#create'
  get "logout", to: 'sessions#destroy'
  resources :categories, except: [:destroy]

end
