Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :trainers, only: [:show, :index, :create, :edit, :update]
  resources :users, only: [:show, :index, :create, :edit, :update] do
    resources :dogs, only: [:create, :show, :index, :destroy, :update]
  end
  
  post '/login', to: 'sessions#create'
  post '/autologin', to: 'sessions#autologin'
end
