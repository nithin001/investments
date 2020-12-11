class CreateDoubleEntryTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :double_entry_transactions do |t|
      t.date :transaction_date
      t.integer :credit_account_id
      t.integer :debit_account_id

      t.decimal :amount
      t.timestamps
    end
  end
end
