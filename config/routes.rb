Rails.application.routes.draw do
  root 'homepages#index'
  resource :homepage, only: [:create, :destroy]
  devise_for :users , path: 'session'

  resources :users, only: [:edit, :update , :destroy] do
    get :avatar_generator
    get :fetch_avatar
    patch :update_avatar
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
    resources :token_packs, only: [:create, :edit, :update, :destroy]
    resources :feedbacks, only: [:create, :edit, :update, :destroy]
    resources :awards, only: [:create, :update, :destroy]
  end

  get :search, to: "search#search_query"
end
