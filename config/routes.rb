Rails.application.routes.draw do
  get 'comments/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  root to: "questions#index"

  resources :questions do
    resources :answers
    resources :comments
  end

  resources :answers do
    resource :comments
    
  end

end
