Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end

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
