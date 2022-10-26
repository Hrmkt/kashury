Rails.application.routes.draw do
  #get 'home/top'
  get '/', to: 'home#top'
  resources :labels
  resources :pins
  resources :housepictures
  resources :houses
  resources :districts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
