Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'worlds#index'

  get '/worlds', to: 'worlds#index'
  get '/worlds/new', to: 'worlds#new', as: 'new_world'
  post '/worlds', to: 'worlds#create'
  get '/worlds/:world_id/world_cities/new', to: 'cities#new', as: 'new_world_city'
  post '/worlds/:world_id/world_cities', to: 'cities#create'
  get '/worlds/:world_id/world_cities', to: 'cities#world_cities', as: 'world_cities'
  get '/worlds/:id', to: 'worlds#show', as: 'show_world'
  get '/worlds/:id/edit', to: 'worlds#edit', as: 'edit_world'
  post '/worlds/:id/generate_city', to: 'worlds#generate_city', as: 'generate_city_world'
  patch '/worlds/:id', to: 'worlds#update'
  delete '/worlds/:id', to: 'worlds#destroy', as: 'delete_world'



  get '/cities', to: 'cities#index'
  get '/cities/new', to: 'cities#new', as: 'new_city'
  post '/cities', to: 'cities#create'
  get '/cities/:city_id/city_inhabitants', to: 'inhabitants#city_inhabitants', as: 'city_inhabitants'
  get '/cities/:id', to: 'cities#show', as: 'city'
  get '/cities/:id/edit', to: 'cities#edit', as: 'edit_city'
  patch '/cities/:id', to: 'cities#update'
  delete '/cities/:id', to: 'cities#destroy', as: 'delete_city'
  delete '/cities/:city_id/city_inhabitants/:id', to: 'inhabitants#destroy', as: 'delete_city_inhabitant'
  post "/cities/:id/generate_inhabitants", to: "cities#generate_inhabitants_action", as: "generate_inhabitants_city"
get '/worlds/:id', to: 'worlds#show', as: 'world'




  get '/inhabitants', to: 'inhabitants#index'
  get '/inhabitants/:id', to: 'inhabitants#show', as: 'inhabitant'
  get '/inhabitants/:id/edit', to: 'inhabitants#edit', as: 'edit_inhabitant'
  patch '/inhabitants/:id', to: 'inhabitants#update'
  delete '/inhabitants/:id', to: 'inhabitants#destroy', as: 'delete_inhabitant'

  post '/generate_world', to: 'worlds#generate_world', as: 'generate_world'
end