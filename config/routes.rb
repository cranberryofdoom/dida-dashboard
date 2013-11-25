DidaDashboard::Application.routes.draw do
  devise_for :users
  resources :teams

  resources :projects do
    post "update_team"
  end




  root 'projects#index'

end
