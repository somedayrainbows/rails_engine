Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :items do
        get "/find", to: "find_items#show"
        get "/find_all", to: "find_items#index"
        get '/random', to: 'random#show'
      end
      resources :items, only: [:index, :show]
      
      namespace :invoices do
        get "/find", to: "find_invoices#show"
        get "/find_all", to: "find_invoices#index"
        get '/random', to: 'random#show'
      end
      resources :invoices, only: [:index, :show]
      
      namespace :invoice_items do
        get "/find", to: "find_invoice_items#show"
        get "/find_all", to: "find_invoice_items#index"
        get '/random', to: 'random#show'
      end
      resources :invoice_items, only: [:index, :show]
      
      namespace :customers do
        get "/find", to: "find_customers#show"
        get "/find_all", to: "find_customers#index"
        get '/random', to: 'random#show'
      end
      resources :customers, only: [:index, :show]

      resources :invoices, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :customers, only: [:index, :show]

      resources :merchants, only: [:index, :show]
    end
  end
end
