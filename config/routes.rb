Rails.application.routes.draw do
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
   
   
  get 'users/new'

  get 'users/update'
  resources :users do
    member do
     
    end
  end
  
  root to: 'pages#home'
  resources :weddings do
    member do

    end
  end
  resources :sessions
  resources :inquiries do
    member do
      post 'close_wedding'
      post 'book_wedding'
    end
  end
end
