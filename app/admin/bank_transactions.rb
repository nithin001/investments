# frozen_string_literal: true

ActiveAdmin.register BankTransaction do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :notes, :transactions, :type, :member_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:notes, :transactions, :type]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    column :notes
    column :actions do |transaction|
      link_to('Process', process_transactions_admin_bank_transaction_path(transaction))
    end
  end

  member_action :process_transactions, method: :get do
    resource.process!
    redirect_to admin_bank_transactions_path, notice: 'Processed!'
  end
end
