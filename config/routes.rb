Rails.application.routes.draw do
  get 'pages/home'

  get 'pages/contact'

  get 'pages/about'

  resources :blogs
end
