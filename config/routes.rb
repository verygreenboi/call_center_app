CallCenterApp::Application.routes.draw do
  resources :accounts

  resources :banks

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end