Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/worlds', to: 'worlds#index'
  get '/worlds/new', to: 'worlds#new', as: 'new_world'
  post '/worlds', to: 'worlds#create'
  get '/worlds/:world_id/world_cities', to: 'cities#world_cities', as: 'world_cities'
  get '/worlds/:id', to: 'worlds#show', as: 'world'

  get '/cities', to: 'cities#index'
  get '/cities/new', to: 'cities#new', as: 'new_city'
  post '/cities', to: 'cities#create'
  get '/cities/:city_id/city_inhabitants', to: 'inhabitants#city_inhabitants', as: 'city_inhabitants'
  get '/cities/:id', to: 'cities#show', as: 'city'
  get '/cities/:id/edit', to: 'cities#edit', as: 'edit_city'
  patch '/cities/:id', to: 'cities#update'

  get '/inhabitants', to: 'inhabitants#index'
  get '/inhabitants/:id', to: 'inhabitants#show', as: 'inhabitant'
end