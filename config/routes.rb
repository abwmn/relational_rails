Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/worlds', to: 'worlds#index'
  get '/cities', to: 'cities#index'
end
