# frozen_string_literal: true

class FixedDeposit < ApplicationRecord
  has_many :investments, as: :investable

  accepts_nested_attributes_for :investments, allow_destroy: true

  def current_value
    maturity_amount
  end
end
