Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#index'
  
  resources :players
  resource :session, only: [:create, :destroy, :new]
  resources :recruits
  resources :notes
  resource :user, only: [:create, :new, :show] do
    resource :counter, only: [:update]
  end

  post 'players/filter', to: 'players#filter'
end
