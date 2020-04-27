Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :players
  resources :teams
  resources :schools
  resources :conferences
  resources :coaches
  resources :athletic_directors
  resources :classifications
end
