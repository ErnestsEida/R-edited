Rails.application.routes.draw do
  root 'home#index'
  resources :users, only:[:edit, :update , :destroy]
  resources :posts
  devise_for :users , path: 'session'
  resources :users, only: [:edit, :update , :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
