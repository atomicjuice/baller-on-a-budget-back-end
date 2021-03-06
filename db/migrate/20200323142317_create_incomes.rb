class CreateIncomes < ActiveRecord::Migration[6.0]
  def change
    create_table :incomes do |t|
      t.string :name
      t.integer :amount
      t.string :frequency
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
