Rails.application.routes.draw do
  
   get  '/signup',  to: 'users#new'
   root 'top#index'
   post '/signup',  to: 'users#create'
   resources :users
  
end
