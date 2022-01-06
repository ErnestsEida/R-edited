Rails.application.routes.draw do
  root 'home#index'
  resources :home, only: [:index, :create, :destroy]
  devise_for :users , path: 'session'
  resources :users, only: [:edit, :update , :destroy]
  resources :communities do
    resources :posts do
      resources :comments, shallow: true, only: [:destroy, :create, :update, :show]
    end
  end
  resources :bookmarked_posts, only: [:index] do
    post :bookmark
  end
  post "reward/", to: "post_awards#reward"
  resources :tags, only: [:show]
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  namespace :admin do
    get "dashboard"
    get "manage_users"
    get "manage_homepage"
  end
  get "search", to: "search#search_query"
end
