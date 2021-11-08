Rails.application.routes.draw do
  root 'home#index'
  resources :users, only:[:edit, :update , :destroy]
  devise_for :users , path: 'session'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
