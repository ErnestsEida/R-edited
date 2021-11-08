Rails.application.routes.draw do
  devise_for :users, path: 'session'

  root 'home#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
