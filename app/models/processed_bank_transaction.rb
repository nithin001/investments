class ProcessedBankTransaction < ApplicationRecord
  has_many :double_entry_transactions
  belongs_to :member

  def display_value
    "#{transaction_date.to_s} - #{narration} - #{amount}"
  end
end
