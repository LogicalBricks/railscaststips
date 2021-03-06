R13Team376::Application.routes.draw do
  get 'tags/:tag', to: 'treasures#index', as: :tag
  resources :railscasts do
    collection { get :load }
  end
  resources :treasures, path: 'tips' do
    member { post :vote }
  end

  get "home/index"
  get "/about" => "home#about", as: :about
  get "/faq" => "home#faq", as: :faq

  root 'home#index'
  get "/tweets" => "home#tweets"

  get "auth/:provider/callback" => "sessions#create"
  get 'auth/failure', to: redirect('/')
  get "signout" => "sessions#destroy", as: :signout
end
