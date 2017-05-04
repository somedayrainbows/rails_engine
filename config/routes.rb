Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get "/find", to: "find_merchants#show"
        get "/find_all", to: "find_merchants#index"
        get "/random", to: "random_merchants#show"
        get "/:id/items", to: "items#index"
        get "/:id/invoices", to: "invoices#index"
      end
      resources :merchants, only: [:index, :show]

      namespace :items do
        get "/find", to: "find_items#show"
        get "/find_all", to: "find_items#index"
        get '/random', to: 'random#show'
        get '/:id/invoice_items', to: 'invoice_items#index'
        get '/:id/merchant', to: 'merchant#show'
      end
      resources :items, only: [:index, :show]

      namespace :invoices do
        get "/find", to: "find_invoices#show"
        get "/find_all", to: "find_invoices#index"
        get '/random', to: 'random#show'
        get "/:id/customer", to: "customer#show"
      end
      resources :invoices, only: [:index, :show]

      namespace :invoice_items do
        get "/find", to: "find_invoice_items#show"
        get "/find_all", to: "find_invoice_items#index"
        get '/random', to: 'random#show'
        get '/:id/invoice', to: 'invoice#show'
        get '/:id/item', to: 'item#show'
      end
      resources :invoice_items, only: [:index, :show]

      namespace :customers do
        get "/find", to: "find_customers#show"
        get "/find_all", to: "find_customers#index"
        get '/random', to: 'random#show'
        get '/:id/invoices', to: 'invoices#index'
        get ':id/transactions', to: 'transactions#index'
      end
      resources :customers, only: [:index, :show]

      namespace :transactions do
        get "/find", to: "find_transactions#show"
        get "/find_all", to: "find_transactions#index"
      end
      resources :transactions, only: [:index, :show]
    end
  end
end
