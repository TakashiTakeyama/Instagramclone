Rails.application.routes.draw do
  resources :pictures
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
