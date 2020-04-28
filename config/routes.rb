Rails.application.routes.draw do
  resources :ingredientes
  resources :hamburguesas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

end
