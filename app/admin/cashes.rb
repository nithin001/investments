# frozen_string_literal: true

ActiveAdmin.register Cash do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params investments_attributes: %i[id member_id status source notes bought_on sold_on _destroy buy_value sell_value]
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
    f.inputs do
      f.has_many :investments, allow_destroy: true do |item|
        item.input :member
        item.input :buy_value
        item.input :sell_value

        item.input :bought_on
        item.input :sold_on
        item.input :status
        item.input :notes
        item.input :source
      end
    end

    f.actions
  end
end
