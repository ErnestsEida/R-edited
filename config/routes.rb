Rails.application.routes.draw do
  root 'home#index'
  patch 'home/carousel_images', to: "home#carousel_images"
  delete 'home/carousel_images/:id', to: "home#destroy_carousel_image", as: :destroy_carousel_image
  resources :users, only:[:edit, :update , :destroy]
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
    get "manage_token_packs"
  end
  resources :token_packs, only: [:create, :edit, :update, :destroy]

  get "search", to: "search#search_query"
end
