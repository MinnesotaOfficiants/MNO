Rails.application.routes.draw do

  get "log_out" , to: "sessions#destroy", as: "log_out"
  get "log_in" ,to: "sessions#new", as: "log_in"
   
   
 
  resources :users do
    member do
     
    end
  end
  
  root to: 'pages#home'
  
  resources :weddings do
      resources :payments
      resources :inquiries
      resources :email_templates
  end

  resources :sessions
  resources :inquiries do
    resources :email_templates
    member do
      post 'close_wedding'
      post 'book_wedding'
    end
  end
resources :email_templates
  
end
