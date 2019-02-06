Rails.application.routes.draw do
  resources :portfolios
  get 'pages/home'

  get 'pages/contact'

  get 'pages/about'

  resources :blogs
end
