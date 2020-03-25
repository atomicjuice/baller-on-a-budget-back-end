Rails.application.routes.draw do
  resources :expenses
  resources :incomes
  resources :budgets
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

   post "/signin", to: "users#sign_in"
   post "/signup", to: "users#create"
   post "/income-form", to: "incomes#create"
   post "/expense-form", to: "expenses#create"
   post "/user-main-page", to: "users#weekly_budget"
   get "/all-income", to: "users#all_user_income"
   patch "/income-form/:id", to: "incomes#update"
   get '/income-form/:id', to: "incomes#show"
end
