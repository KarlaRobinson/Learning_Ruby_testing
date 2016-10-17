Rails.application.routes.draw do
  get 'question/index'

  get 'answer_vote/index'

  get 'user/index'

      #'path' => 'action'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'user#index'
end
