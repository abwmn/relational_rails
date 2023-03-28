Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/worlds', to: 'worlds#index'
  get '/worlds/:id', to: 'worlds#show', as: 'world'
  get '/cities', to: 'cities#index'
  get '/cities/:id', to: 'cities#show', as: 'city'
end