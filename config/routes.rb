Rails.application.routes.draw do
  get 'password_resets/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'
  
  resources :players
  resource :session, only: [:create, :destroy, :new]
  resources :recruits
  resources :notes
  resources :todos
  resources :targetgames
  resources :contact_cards
  resources :contests
  resources :password_resets
  resources :news_items
  resource :user, only: [:create, :new, :show] do
    resource :counter, only: [:update]
  end

  get '/orders', :to => 'orders#index'
  post :create_order, :to => 'orders#create_order'
  post :capture_order, :to => 'orders#capture_order'
  post 'players/filter', to: 'players#filter'
  post 'users/filter', to: 'users#filter'

end
