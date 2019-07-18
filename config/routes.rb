Rails.application.routes.draw do
  resources :favorites, only:[:create, :destroy, :index, :show] do
    collection do
      get 'okiniiri'
    end
  end
  resources :sessions
  resources :users
  resources :pictures
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  get 'favorites/okiniiri', to: 'favorites#okiniiri'
end
