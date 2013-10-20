R13Team376::Application.routes.draw do
  get 'tags/:tag', to: 'treasures#index', as: :tag
  resources :railscasts
  resources :treasures, path: 'tips' do
    member { post :vote }
  end

  get "home/index"
  get "about" => "home#about"
  get "/faq" => "home#faq"

  root 'home#index'
  get "/tweets" => "home#tweets"

  get "auth/:provider/callback" => "sessions#create"
  get "tryit" => "sessions#create", as: :tryit
  get 'auth/failure', to: redirect('/')
  get "signout" => "sessions#destroy", as: :signout
end
