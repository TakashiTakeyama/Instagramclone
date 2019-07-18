Rails.application.routes.draw do
  resources :favorites, only:[:create, :destroy, :index, :show]
  # get 'users/okiniiri', to: 'users#okiniiri'
  resources :sessions
  resources :users
  resources :pictures
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
