Rails.application.routes.draw do


  get "songs/upload", :as => "upload"
  get "songs/delete", :as => "delete"

  root :to => "songs#index"

  resources :songs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
