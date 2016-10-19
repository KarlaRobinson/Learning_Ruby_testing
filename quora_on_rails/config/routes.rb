Rails.application.routes.draw do
  get 'users/index'

  get 'users/new'

  # # receive form and create a user in db using data given by user
  # get '/register' => 'users#new'
  # post '/users' => 'users#create'

      #'path' => 'action'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#new'

  # CRUD for classes: GET, POST, PATCH, PUT and DELETE
  resources :users, :questions, :answers
end
