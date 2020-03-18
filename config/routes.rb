Rails.application.routes.draw do
  resources :budgets
  resources :users
  resources :expenses
  resources :incomes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

   post "/signin", to: "users#sign_in"
   get '/signup', to: 'users#create'
end
