Rails.application.routes.draw do

  get 'songs/index'

  get 'songs/create'

  get 'songs/delete'

  root 'songs#index'

  resources :songs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
