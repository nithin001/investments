ActiveAdmin.register Investment do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :buy_value, :status, :bought_on, :sold_on, :notes, :member_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :initial, :current, :member_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  #
  index do
    column :buy_value
    column :current_value
    column :status
    column :bought_on
    column :sold_on
    column :investable_type

    actions
  end
end
