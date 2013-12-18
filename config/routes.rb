Agah::Application.routes.draw do
  resources :answers

  resources :questions

  root to: 'home#index'
  get '*ember' => 'home#index'
end
