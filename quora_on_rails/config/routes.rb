Rails.application.routes.draw do
#'controller/path' => 'method/action'

  get 'users/logout'
  post 'users/login'

  get 'questions/all'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#new'

  # CRUD for classes: GET, POST, PATCH, PUT and DELETE
  # resources :users, :questions, :answers

  resources :users do
    resources :questions do
      resources :answers
    end
  end

end
