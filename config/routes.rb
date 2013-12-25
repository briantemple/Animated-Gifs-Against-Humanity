Agah::Application.routes.draw do
  scope "api/1/" do
    resources :answers
    resources :questions
  end

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  root to: 'home#index'
  get '*' => 'home#index'
end
