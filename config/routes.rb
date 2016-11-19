Rails.application.routes.draw do

  devise_for :users
  resources :users
  get "songs/upload", :as => "upload"
  get "songs/delete", :as => "delete"
  get "songs/index", :as => "index"

  root :to => "songs#index"

  resources :songs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
