Rails.application.routes.draw do

  # get 'email_templates/new'

  # get 'email_templates/edit'

  get "log_out" , to: "sessions#destroy", as: "log_out"
  get "log_in" ,to: "sessions#new", as: "log_in"
   
   get "fee_report" , to: "weddings#fee_report"
   get "send_fee_email" , to: "weddings#send_fee_email"

       
 
  resources :users do
    member do
     
     
    end
  end
  
  root to: 'pages#home'
  
  resources :weddings do
      resources :payments
      resources :inquiries
      resources :email_templates
      member do
        get 'get_new_web_requests'
        post 'add_payment'
        post "set_fee_payment"
      end
  end

  resources :sessions
  resources :inquiries do
    resources :email_templates
    resources :email_histories
    member do
      post 'close_wedding'
      post 'book_wedding'
    end
  end
resources :email_templates do
  member do
    get 'preview'
  end
end


  
end
