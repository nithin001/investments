class AddBankTransactionIdToProcessedBankTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :processed_bank_transactions, :bank_transaction_id, :integer
  end
end
