Rails.application.routes.draw do
  devise_for :users
  root to: 'dishes#index'
  resources :dishes do
    member do
      get 'genre_shows'
      get 'genre_show'
    end
  end
  resources :genres
end
