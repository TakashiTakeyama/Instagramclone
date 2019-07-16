Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  resources :favorites, only:[:create, :destroy]
  resources :sessions
  resources :users
  resources :pictures
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
