class AddMemberToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :bank_transactions, :member_id, :integer
    add_column :processed_bank_transactions, :member_id, :integer
    add_column :double_entry_transactions, :member_id, :integer
  end
end
