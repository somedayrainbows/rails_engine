Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get "/find", to: "find_merchants#show"
        get "/find_all", to: "find_merchants#index"
        get "/random", to: "random_merchants_#show"
      end
      resources :merchants, only: [:index, :show]
      
      namespace :items do
        get "/find", to: "find_items#show"
        get "/find_all", to: "find_items#index"
      end
      resources :items, only: [:index, :show]
      
      namespace :invoices do
        get "/find", to: "find_invoices#show"
        get "/find_all", to: "find_invoices#index"
      end
      resources :invoices, only: [:index, :show]
      
      namespace :invoice_items do
        get "/find", to: "find_invoice_items#show"
        get "/find_all", to: "find_invoice_items#index"
      end
      resources :invoice_items, only: [:index, :show]
    end
  end
end
