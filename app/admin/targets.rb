# frozen_string_literal: true

ActiveAdmin.register Target do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :member_id, :value
  #
  # or
  #
  # permit_params do
  #   permitted = [:member_id, :year]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
