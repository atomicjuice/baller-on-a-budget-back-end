class User < ApplicationRecord
  has_many :incomes
  has_many :expenses
  has_one :budget
  # has_secure_password  
end
