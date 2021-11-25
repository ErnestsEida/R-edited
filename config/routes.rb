Rails.application.routes.draw do
  root 'home#index'
  resources :users, only:[:edit, :update , :destroy]
  devise_for :users , path: 'session'
  resources :users, only: [:edit, :update , :destroy]
  resources :communities do
    resources :posts
  end
  resources :bookmarked_posts, only: [:index] do
    put :bookmark
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
