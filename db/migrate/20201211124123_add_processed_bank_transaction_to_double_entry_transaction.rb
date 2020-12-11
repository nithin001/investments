class AddProcessedBankTransactionToDoubleEntryTransaction < ActiveRecord::Migration[6.0]
  def change
    add_column :double_entry_transactions, :processed_bank_transaction_id, :integer
  end
end
