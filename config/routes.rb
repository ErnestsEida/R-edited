Rails.application.routes.draw do
  root 'home#index'
  resources :users, only:[:edit, :update , :destroy]
  devise_for :users , path: 'session'
  resources :users, only: [:edit, :update , :destroy]
  resources :communities do
    resources :posts
  end
  resources :comments, only: [:destroy, :create, :update, :show]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
