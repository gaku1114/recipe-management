Rails.application.routes.draw do
  devise_for :users
  root to: 'dishes#index'
  resources :dishes do
    resources :materials, only: [:create]
    member do
      get 'genre_index'
      get 'genre_show'
    end
    
    collection do 
      get 'search'
    end
  end
  resources :genres
  
end
