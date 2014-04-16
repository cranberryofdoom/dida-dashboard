DidaDashboard::Application.routes.draw do
  
  root :to => 'static#index'
  devise_for :users

  resources :users do
    post "update_position"
  end
  
  resource :calendar

  resources :projects do
    post "update_team"
    post "update_designer"
    post "create_post"
  end

  resources :teams do
    post "add_designer"
    post "remove_designer"
    collection do
      post "create_user"
      post "delete_designer"
    end
  end

  get '/index' => 'static#index'
  get '/about' => 'static#about'
  get '/team' => 'static#team'
  get '/portfolio' => 'static#portfolio'
  get '/join' => 'static#join'
  get '/policies' => 'static#policies'
  get '/request' => 'projects#new'
end
