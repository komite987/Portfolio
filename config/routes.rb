Rails.application.routes.draw do
  resources :portfolios

  root 'pages#home'

  get 'about', to: 'pages#about'

  get 'contact', to: 'pages#contact'

  resources :paragraphs
  resources :articles
  resources :posts
  resources :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
