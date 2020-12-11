class CreateProcessedBankTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :processed_bank_transactions do |t|
      t.string :uid
      t.string :narration
      t.date :transaction_date
      t.decimal :amount

      t.timestamps
    end
  end
end
