Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  get '/shelters/:id', to: 'shelters#show'
  post '/shelters', to: 'shelters#create'
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  get '/shelters/:id/delete', to: 'shelters#destroy'
  delete '/shelters/:id', to: 'shelters#destroy'
  get '/shelters/:id/pets/new', to: 'pets#new'
  get '/shelters/:id/pets', to: 'shelter_pets#index'


  get '/shelters/:id/new', to: 'reviews#new'
  post '/shelters/:id', to: 'reviews#create'
  get '/shelters/:shelter_id/review/:id/edit', to: 'reviews#edit'
  patch '/shelters/:shelter_id/review/:id', to: 'reviews#update'
  get '/shelters/:shelter_id/review/:id/delete', to: 'reviews#destroy'


  get '/pets', to: 'pets#index'
  get '/pets/:id', to: 'pets#show'
  post '/shelters/:id/pets', to: 'pets#create'
  get '/pets/:id/edit', to: 'pets#edit'
  patch '/pets/:id', to: 'pets#update'
  delete '/pets/:id', to: 'pets#destroy'

  get '/favorites', to: 'favorites#index'
  patch '/favorite/:pet_id', to: 'favorites#update'
  delete '/favorite/:pet_id', to: 'favorites#destroy'
  delete '/favorites/delete_all', to: 'favorites#destroy_all'

  post '/application/new', to: 'applications#create'
  get '/application/new', to: 'applications#new'
  get '/application/:id', to: 'applications#show'
  get '/application/:id/index', to: 'applications#index'
  patch '/pets/:id/application/:app_id/approve', to: 'applications#update'
  patch '/pets/:id/application/:app_id/revoke', to: 'applications#update'
end
