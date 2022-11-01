Rails.application.routes.draw do
  #get 'home/top'
  get '/', to: 'home#top'
  resources :labels
  resources :pins
  resources :housepictures
  resources :houses
  resources :districts
  get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'
    get '/users/:id', to: 'users#show', as: 'profile'
    delete '/users/:id', to: 'users#destroy', as: 'unsubscribe'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/image_of_housepictures/:id', to: 'housepictures#get_image', as:'image_of_housepictures'
end
