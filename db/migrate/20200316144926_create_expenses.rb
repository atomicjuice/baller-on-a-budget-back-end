class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :amount
      t.string :frequency

      t.timestamps
    end
  end
end
