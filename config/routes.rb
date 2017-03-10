Rails.application.routes.draw do
  root to: 'pages#home'
  resources :weddings do
    member do

    end
  end
end
