Rails.application.routes.draw do
  # get 'home/index' # la ruta de llamado para home/index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get "bienvenida", to: "home#index" # home/index lo redirecciona a /bienvenida
  root to: "home#index" # definir la raiz de la web

  get "newpost", to: "posts#new" # post/new lo redirecciona a /newpost
  get "posts/:id", to: "posts#show" # post/show lo redirecciono a /showpost
  get "posts/:id/edit", to: "posts#edit" # posts/edit lo redirecciona a un submodulo de show llamado /edit

  patch "posts/:id", to: "posts#update", as: :post # creamos la ruta de entrada al update para edit
  post "posts", to: "posts#create" # creamos la ruta de cierre de create para new
  delete "posts/:id", to: "posts#destroy"
end
