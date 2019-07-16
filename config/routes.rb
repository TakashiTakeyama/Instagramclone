Rails.application.routes.draw do
  resources :users, only:[:new]
  resources :pictures
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
