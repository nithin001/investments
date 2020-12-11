ActiveAdmin.register DoubleEntryTransaction do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :transaction_date, :credit_account_id, :debit_account_id, :amount
  #
  # or
  #
  # permit_params do
  #   permitted = [:transaction_date, :credit_account_id, :debit_account_id, :amount]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
