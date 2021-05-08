Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'sign-up', to: 'accounts#new'
  post 'sign-up', to: 'accounts#create'

  get 'sign-in', to: 'sessions#new'
  post 'sign-in', to: 'sessions#create'
  delete 'sign-out', to: 'sessions#destroy'

  resources :users, only: %i[show]
  resources :followers, only:  %i[update destroy]
  resources :posts, only:  %i[new create show]
  resources :likes, only: %i[create destroy]
  resources :notifications, only: %i[index]

  get 'explore/:hashtag', to: 'explorer#index', as: :explore
  root to:  'posts#index'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
