Rails.application.routes.draw do
  scope '(:locale)', locale: /pt-BR|en/ do
    devise_for :users, controllers: { registrations: 'resgistration_users/registrations' }
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :reservations
    
    resources :users
    
    root 'reservations#index'
  end
end
