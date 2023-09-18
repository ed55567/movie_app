# config/routes.rb


Rails.application.routes.draw do
  resources :movies, only: [:index, :show]
  get '/search', to: 'search#index', as: 'search_index'
end
