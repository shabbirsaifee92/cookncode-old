Rails.application.routes.draw do
  resources :topics, only: [:index, :show]

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  # resources :portfolios, except: [:show] do
  #   put :sort, on: :collection
  # end

  # get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get '/contact', to: 'pages#contact'
  get 'about-me', to: 'pages#about'
  get 'tech-news', to: 'pages#tech_news'
  resources :tech_blogs, path: 'tech-blogs' do
    member do
      post :toggle_status
    end
  end

  resources :food_blogs, path: 'food-blogs', only: [:index] do
  end
  
  mount ActionCable.server => '/cable'
  root to: 'pages#home'
end
