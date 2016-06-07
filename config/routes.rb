Rails.application.routes.draw do
  get 'users/new'

  get 'sessions/new'
  
  get 'hello' => 'application#hello'
  
  get 'test'    => 'static_pages#test'

  root 'static_pages#home'
  
  get 'home'    => 'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'settings'   => 'static_pages#settings'
  get 'guest'   => 'static_pages#guest'
  get 'browse'   => 'browse#home'
  get 'r'   => 'browse#refresh'
  get 'u'   => 'browse#back'
  post 'browses'   => 'browse#upload'
  post 'browse'   => 'browse#fcreate'
  
  get 'signup'  => 'users#new'
  
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  resources :users
end