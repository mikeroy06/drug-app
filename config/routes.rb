Rails.application.routes.draw do
  resources :drugs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'drugs#index'
end
