Rails.application.routes.draw do
  devise_for :users
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get '/contact', to: 'pages#contact'
  get 'about-me', to: 'pages#about'

  resources :blogs do
    member do
      post :toggle_status
    end
  end

  root to: 'pages#home'
end
