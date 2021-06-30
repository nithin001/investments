# frozen_string_literal: true

ActiveAdmin.register Investment do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :buy_value, :status, :bought_on, :sold_on, :notes, :member_id, :source
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :initial, :current, :member_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  #

  filter :by_year, as: :select, collection: [2019, 2020, 2021, 2022]
  filter :investable_type
  filter :member
  filter :status

  index do
    column :member
    column :buy_value
    column :current_value
    column :status
    column :financial_year
    column :investable_type
    column :source
    actions

    div class: 'panel' do
      para "Total invested amount: #{collection.pluck(:buy_value).reduce(:+)}"
      br
      para "Current value of investments: #{collection.map(&:current_value).reduce(:+)}"
    end
  end
end
