Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'back-stage', to: 'backstage#index'
  get 'back-stage/style-guide', to: 'backstage#style'
  get 'back-stage/dev-info', to: 'backstage#dev'
  root 'home#index'
end
