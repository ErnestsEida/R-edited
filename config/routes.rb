Rails.application.routes.draw do
  root 'home#index'
  put 'users/edit'
  delete 'users/destroy/:id', to:'users#destroy'
  devise_for :users

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
