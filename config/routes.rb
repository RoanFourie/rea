Rails.application.routes.draw do
  get 'offices/show'

  get 'sessions/new'

  get 'users/new'

  get 'searches/show'

  get 'home/index'
  root :to => 'home#index'
  resource :search
  resources :users
  get "activate/:code" => "users#activate", :as => "activate"
  resources :session
  resource :office

end
