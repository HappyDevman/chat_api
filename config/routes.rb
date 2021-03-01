Rails.application.routes.draw do
  resources :channels
  resources :users, only: :index
  scope defaults: { format: :json } do
    devise_for :users, controllers: { sessions: 'sessions', registrations: 'registrations' }
    resources :messages
  end
end
