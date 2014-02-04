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
    post "remove_designer"
    collection do
      post "create_user"
      post "delete_designer"
    end
  end

  resources :users, only: [:show, :edit, :update]

  root 'home#index'
end
