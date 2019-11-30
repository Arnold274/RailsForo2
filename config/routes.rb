Rails.application.routes.draw do
  devise_for :users
  # get 'home/index' # la ruta de llamado para home/index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get "bienvenida", to: "home#index" # home/index lo redirecciona a /bienvenida
  root to: "home#index" # definir la raiz de la web

  # €stas son las rutas agregadas y modificadas para los usuarios
  get "user/:user_id", to: "posts#from_author"

  # Estas son las rutas para los posts
  get "posts", to: "posts#index" # post/index sera redireccionado a /posts
  get "newpost", to: "posts#new", as: :new_post # post/new lo redirecciona a /newpost
  get "posts/:id", to: "posts#show" # post/show lo redirecciono a /showpost
  get "posts/:id/edit", to: "posts#edit", as: :edit_post # posts/edit lo redirecciona a un submodulo de show llamado /edit

  patch "posts/:id", to: "posts#update", as: :post # creamos la ruta de entrada al update para edit
  post "posts", to: "posts#create" # creamos la ruta de cierre de create para new
  delete "posts/:id", to: "posts#destroy"
end
