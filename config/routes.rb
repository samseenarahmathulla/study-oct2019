Rails.application.routes.draw do
  # get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  root 'welcome#index'
  resources :articles do
    resources :comments
  end

  #to run sidqkiq web in this project - samseena
  require 'sidekiq/web'

  mount Sidekiq::Web, at: '/sidekiq'
end
