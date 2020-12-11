# frozen_string_literal: true

class CreateBankTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :bank_transactions do |t|
      t.string :notes
      t.text :transactions
      t.string :type, default: 'BankTransaction'

      t.timestamps
    end
  end
end
