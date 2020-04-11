Rails.application.routes.draw do
  resources :portfolios
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
  resources :paragraphs
  resources :articles
  resources :posts
  resources :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
