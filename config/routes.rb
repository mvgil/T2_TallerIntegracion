Rails.application.routes.draw do
  #resources :hamburguesaingredientes
  #resources :ingredientes
  #resources :hamburguesas
  # Rutas de hamburguesa:
  get '/hamburguesa/', to: 'hamburguesas#index'
  post '/hamburguesa/', to: 'hamburguesas#create'
  get '/hamburguesa/:id', to: 'hamburguesas#show'
  delete '/hamburguesa/:id', to: 'hamburguesas#destroy'
  patch '/hamburguesa/:id', to: 'hamburguesas#update'

  #Rutas de ingrediente: 
  get '/ingrediente/', to: 'ingredientes#index'
  post '/ingrediente/', to: 'ingredientes#create'
  get '/ingrediente/:id', to: 'ingredientes#show'
  delete '/ingrediente/:id', to: 'ingredientes#destroy'

  #Rutas anidadas /hamburguesa/:id_hamburguesa/ingrediente/:id_ingrediente
  delete 'hamburguesa/:id_hamburguesa/ingrediente/:id_ingrediente', to: 'hamburguesaingredientes#destroy'
  put 'hamburguesa/:id_hamburguesa/ingrediente/:id_ingrediente', to: 'hamburguesaingredientes#agregar_ingrediente'
  #get 'hamburguesaingrediente', to: 'hamburguesaingredientes#index' # para debug
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get 'prueba/:id_hola', to: 'hamburguesaingredientes#index'
  root 'welcome#index'

end
