Rails.application.routes.draw do
  resources :things
  root 'devices#index'
  resources :devices
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
