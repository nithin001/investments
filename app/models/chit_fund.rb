# frozen_string_literal: true

class ChitFund < ApplicationRecord
  has_many :investments, as: :investable

  accepts_nested_attributes_for :investments, allow_destroy: true

  def current_value
    withdrawn_amount
  end
end
