Rails.application.routes.draw do
  resources :guest_book_entries, path: :dropped_memories
  resources :memories
  resources :pdfs
  resources :categories do
    resources :sub_categories
  end
  resources :tags
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'back-stage', to: 'backstage#index'
  get 'back-stage/style-guide', to: 'backstage#style'
  get 'back-stage/dev-info', to: 'backstage#dev'
  get 'home', to: 'home#index'
  get 'document', to: 'media_modal#document'
  get 'movie', to: 'media_modal#movie'
  root 'home#index'
end
