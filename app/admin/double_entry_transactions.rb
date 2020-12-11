# frozen_string_literal: true

ActiveAdmin.register DoubleEntryTransaction do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :transaction_date, :credit_account_id, :debit_account_id, :amount, :processed_bank_transaction_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:transaction_date, :credit_account_id, :debit_account_id, :amount]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  controller do
    def build_new_resource
      super.tap do |resource|
        processed_bank_transaction = ProcessedBankTransaction.where(id: params[:processed_bank_transaction_id])
        if processed_bank_transaction.exists?
          transaction = processed_bank_transaction.first
          resource.transaction_date = transaction.transaction_date
          resource.amount = transaction.amount
          resource.processed_bank_transaction = transaction
        end
      end
    end
  end

  form do |f|
    if resource.processed_bank_transaction
      h3 "Narration: #{resource.processed_bank_transaction.narration}"
    end
    f.inputs do
      f.input :transaction_date
      f.input :amount
      f.input(:credit_account, as: :searchable_select)
      f.input(:debit_account, as: :searchable_select)
      f.input :processed_bank_transaction, as: :select, collection: ProcessedBankTransaction.order(transaction_date: :desc).all.map { |transaction| [transaction.display_value, transaction.id] }
    end

    f.actions
  end
end
