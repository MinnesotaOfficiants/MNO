Rails.application.routes.draw do

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
   
   
 
  resources :users do
    member do
     
    end
  end
  
  root to: 'pages#home'
  
  resources :weddings do
      resources :payments
  end

  resources :sessions
  resources :inquiries do
    member do
      post 'close_wedding'
      post 'book_wedding'
    end
  end

  resources :email_templates
end
