DidaDashboard::Application.routes.draw do
  devise_for :users
  resources :teams

  resources :projects do
    post "update_team"
  end
  resources :teams do
    post "add_designer"
    delete "remove_designer"
  end

  root 'projects#index'

end
