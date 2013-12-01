DidaDashboard::Application.routes.draw do
  devise_for :users
  resources :teams

  namespace :api do
    resources :teams, :defaults => {format: :json} do
      resources :users, :defaults => {format: :json}
    end
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
