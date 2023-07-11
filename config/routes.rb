Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root to: 'home#index'

  concern :favoritable do |options|
    shallow do
      post '/favorite', {to: "favorites#create", on: :member}.merge(options)
      delete '/favorite', {to: "favorites#destroy", on: :member}.merge(options) 
    end
  end

  
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :dashboard, only: :index
      resources :categories, only: [:index, :show]
      resources :search, only: :index
      resources :album, only: :show do
        resources :recently_heards, only: :create
      end
      resources :favorites, only: :index
      resources :songs, only: [] do
        concerns :favoritable, favoritable_type: 'Song'
      end
    end
  end
  #filtrar rotas do rails no terminal: rails | grep {nome_do_caminho_p/_filtrar}

end