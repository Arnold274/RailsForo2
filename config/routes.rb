Rails.application.routes.draw do
  devise_for :users
  root "pages#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #Rutas de las publicaciones
  get "publications/new", to: "publications#new"
  get "publications/:id", to: "publications#show"
  get "publications/:id", to: "publications#edit"
  patch "/publications/:id", to: "publications#update", as: :publication
  post "publications", to: "publications#create"


end
