# frozen_string_literal: true

class ProcessedBankTransaction < ApplicationRecord
  has_many :double_entry_transactions
  belongs_to :member
  belongs_to :bank_transaction

  scope :with_no_double_entry_transaction, -> { left_outer_joins(:double_entry_transactions).where('double_entry_transactions.id is ?', nil) }

  def display_value
    "#{transaction_date} - #{narration} - #{amount}"
  end

  def has_double_entry_transaction
    double_entry_transactions.exists?
  end
end
