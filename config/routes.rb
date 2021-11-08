Rails.application.routes.draw do
  root 'home#index'
  resources :users, only:[:edit, :update]
  delete 'users/destroy/:id', to:'users#destroy'
  devise_for :users

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
