Rails.application.routes.draw do
  resources :sessions
  resources :users
  resources :pictures
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
