Rails.application.routes.draw do
  namespace :users_backoffice do
    get 'welcome/index'
  end
  devise_for :users
  namespace :site do
    get 'home/index'
  end
  resources :tasks

  get 'inicio', to:'site/home#index'
  
  root 'site/home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
