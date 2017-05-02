Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :items do
        get "/find", to: "find_items#show"
        get "/find_all", to: "find_items#index"
      end
      namespace :invoices do
        get "/find", to: "find_invoices#show"
        get "/find_all", to: "find_invoices#index"
      end
      namespace :invoice_items do
        get "/find", to: "find_invoice_items#show"
        get "/find_all", to: "find_invoice#index"
      end
      resources :items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
    end
  end
end
