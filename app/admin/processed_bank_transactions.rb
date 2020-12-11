ActiveAdmin.register ProcessedBankTransaction do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :uid, :double_entry_transaction_id, :narration, :transaction_date, :amount
  #
  # or
  #
  # permit_params do
  #   permitted = [:uid, :double_entry_transaction_id, :narration, :transaction_date, :amount]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  #
  #
  config.clear_action_items!

  index do
    column :uid
    column :member
    column :narration
    column :transaction_date
    column :amount
    column :double_entry_transaction
    column :action do |item|
      link_to "Create an entry", new_admin_double_entry_transaction_path('processed_bank_transaction_id' => item.id)
    end
  end
end
