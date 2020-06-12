Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'question#index'
  get 'question/index'
  post 'question/create', to: 'question#create'
  # get 'question/start'
end
