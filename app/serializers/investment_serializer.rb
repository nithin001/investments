# frozen_string_literal: true

class InvestmentSerializer < ActiveModel::Serializer
  attributes :member_id, :bought_on, :buy_value, :investable_type, :member, :financial_year, :current_value

  def member
    object.member.name
  end
end
