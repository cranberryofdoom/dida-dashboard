DidaDashboard::Application.routes.draw do
  devise_for :users

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

  resources :users


  root 'home#index'
  get '/index' => 'home#index'
  get '/about' => 'home#about'
  get '/team' => 'home#team'
  get '/portfolio' => 'home#portfolio'
  get '/join' => 'home#join'
  get '/policies' => 'home#policies'
  get '/request' => 'projects#new'
end
