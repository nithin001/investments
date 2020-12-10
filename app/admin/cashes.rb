# frozen_string_literal: true

ActiveAdmin.register Cash do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :inr_value, investments_attributes: %i[id member_id status notes bought_on _destroy]
  #
  # or
  #
  # permit_params do
  #   permitted = [:inr_value]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  #
  form do |f|
    f.inputs 'Cash Detail' do
      f.input :inr_value
    end

    f.has_many :investments, allow_destroy: true do |item|
      item.input :member
      item.input :bought_on
      item.input :status
      item.input :notes
    end

    f.actions
  end
end
