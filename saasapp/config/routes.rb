Rails.application.routes.draw do
    root to: 'pages#home'
    devise_for :users, controllers: { registrations: 'users/registrations' }
    resources :users do
        # Singular resource and profile because requiring only one resource and profile per user
       resource :profile 
    end
    get 'about', to: 'pages#about'
    resources :contacts, only: :create
    get 'contact-us', to: 'contacts#new', as: 'new_contact'
    
    # Nested Resources Documentation
    
end
