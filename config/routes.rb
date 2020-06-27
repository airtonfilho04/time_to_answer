Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  
  namespace :site do
    get 'welcome/index'
    get 'search', to: 'search#questions'
  end
  
  namespace :users_backoffice do
    get 'welcome/index'
  end
  
  namespace :admins_backoffice do
    get 'welcome/index' # Dashboard
    resources :admins # Administradores
    resources :subjects # Assuntos
    resources :questions # Questões
  end

  get 'inicio', to: 'site/welcome#index'

  root to: 'site/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
