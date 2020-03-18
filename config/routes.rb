Rails.application.routes.draw do
  resources :budgets
  resources :users
  resources :expenses
  resources :incomes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
