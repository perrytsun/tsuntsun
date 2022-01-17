Rails.application.routes.draw do
  get 'tutorial/test'
  devise_for :users
  resources :users, only: [:show] 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "consultations#index"
  resources :consultations do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  
  end

  get 'tweets/:id' => 'tweets#show',as: 'tweet'
  patch 'tweets/:id' => 'tweets#update'
  delete 'tweets/:id' => 'tweets#destroy'
  get 'tweets/:id/edit' => 'tweets#edit', as:'edit_tweet'
  get 'consultations/new' => 'consultations#new'

  get 'mypage/new' => 'users#show'
  post 'consultations' => 'cosultations#create'


end

