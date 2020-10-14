Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  
  #use :id to find director
  get '/movies/:id/director', to: 'movies#search_directors', as: 'search_directors'
end
