Rails.application.routes.draw do

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :portfolios, except: [:show] do 
    put :sort, on: :collection
  end
	get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'portfolios/angular', to: 'portfolios#angular'
  get 'portfolios/rails', to: 'portfolios#rails'


  root 'pages#home'

  get 'about', to: 'pages#about'

  get 'contact', to: 'pages#contact'

  get 'tech-news', to: 'pages#tech_news'

  resources :posts do
    member do
      get :toggle_status
    end
  end
  
  resources :paragraphs
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
