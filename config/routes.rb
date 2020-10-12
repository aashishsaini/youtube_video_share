Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :videos, only: [:index, :new, :create]
  root to: 'videos#index'
end
