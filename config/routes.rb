DidaDashboard::Application.routes.draw do
  devise_for :users

  namespace :api do
    resources :teams
    resources :users
    resources :projects
  end

  resources :projects do
    post "update_team"
    post "update_designer"
  end
  resources :teams do
    post "add_designer"
    delete "remove_designer"
  end

  root 'home#index'
end
