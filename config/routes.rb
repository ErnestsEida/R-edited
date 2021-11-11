Rails.application.routes.draw do
  root 'home#index'
  devise_for :users , path: 'session'
  resources :users, only:[:edit, :update , :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
