Rails.application.routes.draw do
 # get 'home/top'
  get '/', to: 'home#top'
  resources :labels
  resources :pins
  resources :housepictures
  resources :houses
  resources :districts
  get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'

    get '/profile', to: 'users#show'
    delete '/unsubscribe', to: 'users#destroy'
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/image_of_housepictures/:id', to: 'housepictures#get_image', as:'image_of_housepictures'

  get "search" => "home#search"
  root to: 'home#top'
  get "tag_search" => "home#tag_search"
end