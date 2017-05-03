Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get "/find", to: "find_merchants#show"
        get "/find_all", to: "find_merchants#index"
        get "/random", to: "random_merchants_#show"
      end
      resources :merchants, only: [:index, :show]

      namespace :transactions do
        get "/find", to: "find_transactions#show"
        get "/find_all", to: "find_transactions#index"
      end
      resources :transactions, only: [:index, :show]
    end
  end
end
