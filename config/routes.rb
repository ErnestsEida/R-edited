Rails.application.routes.draw do
  root 'homepages#index'
  resource :homepage, only: [:create, :destroy]
  devise_for :users , path: 'session'

  resources :users, only: [:edit, :update , :destroy] do
    get :avatar_generator
    get :fetch_avatar, on: :collection
    patch :update_avatar, on: :collection
    put :add_tokens
  end

  resources :communities do
    resources :posts do
      resources :comments, shallow: true, only: [:destroy, :create, :update, :show]
    end
  end

  resources :bookmarked_posts, only: [:index] do
    post :bookmark
  end

  post :reward, to: "post_awards#reward"
  resources :tags, only: [:show]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  namespace :admin do
    get :dashboard
    get :users
    get :homepage
    get :token_packs
    get :awards
    get :recent_events
    resources :token_packs, only: [:create, :edit, :update, :destroy]
    resources :feedbacks, only: [:create, :edit, :update, :destroy]
    resources :awards, only: [:create, :update, :destroy]
    resources :recent_events, only: [:create, :update, :edit, :destroy]
  end

  resources :recent_events, only: [:show]
  get :search, to: "search#search_query"
end
