Agah::Application.routes.draw do
  resources :games do
    resources :rounds do
      resources :responses
    end
  end

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  root to: 'home#index'
  get '*' => 'home#index'
end
