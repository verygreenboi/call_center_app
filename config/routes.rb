CallCenterApp::Application.routes.draw do
  resources :calls

  match 'dashboard/users', to: 'users#index', via: :get
  match 'dashboard/banks', to: 'banks#index', via: :get
  match 'dashboard/accounts', to: 'accounts#index', via: :get
  match 'dashboard', to: 'dashboard#index', via: :get
  resources :accounts

  resources :banks

  authenticated :user do
    root to: "dashboard#index", as: :authenticated_root
  end
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  
  # root :to => "home#index"

  # get "accounts/index"
end