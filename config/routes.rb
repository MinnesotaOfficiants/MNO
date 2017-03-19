Rails.application.routes.draw do
  root to: 'pages#home'
  resources :weddings do
    member do

    end
  end
  resources :inquiries do
    member do
      post 'close_wedding'
      post 'book_wedding'
    end
  end
end
