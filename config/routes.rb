DidaDashboard::Application.routes.draw do
  
  root :to => 'home#index'
  devise_for :users, :path_prefix => "admin", :controllers => {:registrations => "registrations"}

  resources :users, :calendar

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

  get '/index' => 'home#index'
  get '/about' => 'home#about'
  get '/team' => 'home#team'
  get '/portfolio' => 'home#portfolio'
  get '/join' => 'home#join'
  get '/policies' => 'home#policies'
  get '/request' => 'projects#new'
end
