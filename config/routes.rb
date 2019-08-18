Rails.application.routes.draw do
  resources :books
  devise_for :users
  root 'home#top'
  resources :users
  # get '/users' => 'users#index'
  get '/home/about' =>'home#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
