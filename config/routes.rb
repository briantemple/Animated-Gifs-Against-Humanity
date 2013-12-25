Agah::Application.routes.draw do
  scope "api/1/" do
    resources :answers
    resources :questions
  end

  root to: 'home#index'
  get '*ember' => 'home#index'
end
