# frozen_string_literal: true

class CreateJoinTableDoubleEntryTransactionTag < ActiveRecord::Migration[6.0]
  def change
    create_join_table :double_entry_transactions, :tags do |t|
      t.index %i[double_entry_transaction_id tag_id], name: 'transaction_tag_index'
      t.index %i[tag_id double_entry_transaction_id], name: 'tag_transaction_index'
    end
  end
end
