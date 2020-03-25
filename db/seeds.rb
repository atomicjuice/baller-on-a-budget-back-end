# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Income.delete_all
Expense.delete_all
Budget.delete_all

users = User.create([{username: 'alex', password:'pass'}])

income = Income.create([{ user_id:1, name: 'job', amount: 1500, frequency: 'monthly' }])

expenses = Expense.create([{ user_id:1, name: 'rent', amount: 800, frequency: 'monthly' }])

budget = Budget.create({user_id:1, amount: nil})


