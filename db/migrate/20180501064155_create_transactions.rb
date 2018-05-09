class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.float :amount
      t.string :description
      t.integer :category_id
      t.date :date
      t.time :time
      t.string :transaction_type

      t.timestamps null: false
    end
  end
end
