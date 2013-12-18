Agah::Application.routes.draw do
  root to: 'home#index'
  get '*ember' => 'home#index'
end
