Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do 
    #devise_for :users
    scope module: :v1 do 
      resources :users, controllers: {sessions: 'users/sessions' } 
      resources :blogposts
      mount_devise_token_auth_for 'User', at: 'auth'
      
    end
  end
end
