Rails.application.routes.draw do
  resources :guest_book_entries, path: :dropped_memories
  resources :memories
  resources :categories
  resources :tags
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'back-stage', to: 'backstage#index'
  get 'back-stage/style-guide', to: 'backstage#style'
  get 'back-stage/dev-info', to: 'backstage#dev'
  get 'home', to: 'home#index'
  root 'home#index'
end
