Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :index, :create, :edit, :update] do
    resources :dogs, only: [:new, :create, :show, :index, :destroy]
  end
  
  post '/login', to: 'sessions#create'
end
