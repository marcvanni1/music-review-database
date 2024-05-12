Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'artists/index'
  resources :artists do
    collection do
      get 'search'
    end
  end
  resources :albums do
    collection do
      get 'search'
    end
  end
  resources :songs do
    collection do
      get 'search'
    end
  end
  resources :genres do
    collection do
      get 'search'
    end
  end

  resources :album_reviews
  resources :song_reviews

  root 'welcome#index'

  resources :users, only: [:new, :create, :show, :destroy] do
    collection do
      get 'search'
    end
  end
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  delete 'logout', to: 'sessions#destroy'

  post 'user/:id/follow', to: 'users#follow', as: 'follow_user'
  delete 'user/:id/unfollow', to: 'users#unfollow', as: 'unfollow_user'
end
