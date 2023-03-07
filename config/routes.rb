Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }
  root to: 'dishes#index'
  resources :dishes do
    resources :materials, only: [:create, :destroy]
    resources :cooks, only: [:new, :create]
    member do
      get 'genre_index'
      get 'genre_show'
      get 'search_show'
      get 'detail'
    end
    
    collection do 
      get 'search'
    end
  end
  
  resources :genres, only: [:index, :new, :create, :edit, :update, :destroy]
  # resources :users, only: :show 
  
end
