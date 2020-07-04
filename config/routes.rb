Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, skip:  [:registrations]
  
  namespace :site do
    get  'welcome/index'
    get  'search', to: 'search#questions'
    post 'answer', to: 'answer#question'
    get  'subject/:subject_id/:subject', to: 'search#subject', as: 'search_subject'
  end
  
  namespace :users_backoffice do
    get 'welcome/index'
    get 'profile', to: 'profile#edit'
    patch 'profile', to: 'profile#update'
  end
  
  namespace :admins_backoffice do
    get 'welcome/index' # Dashboard
    resources :admins # Administradores
    resources :subjects # Assuntos
    resources :questions # Questões
  end

  get 'inicio', to: 'site/welcome#index'
  get 'backoffice', to: 'admins_backoffice/welcome#index'

  root to: 'site/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
