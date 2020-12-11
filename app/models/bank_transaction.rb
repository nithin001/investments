# frozen_string_literal: true

require 'digest/md5'

class BankTransaction < ApplicationRecord
  belongs_to :member

  def process!
    json_transactions = JSON.parse(transactions)
    clean_json_transaction = json_transactions.map do |transaction|
      transaction.reduce({}) { |result, kv| result.merge(Hash[kv[0].strip, (kv[1]).to_s.strip]) }
    end
    clean_json_transaction.each do |transaction|
      transaction_date = Date.strptime(transaction['Date'], '%d/%m/%y')
      uid = Digest::MD5.hexdigest("#{transaction_date}#{transaction['Chq/Ref Number']}")
      amount = transaction['Credit Amount'] == '0' ? transaction['Debit Amount'] : transaction['Credit Amount']
      money = Monetize.parse("INR #{amount}")&.cents / 100
      narration = transaction['Narration']
      ProcessedBankTransaction.where(uid: uid).first_or_create(amount: money, narration: narration, transaction_date: transaction_date, member: member)
    end
    p 'Completed!'
  end
end
