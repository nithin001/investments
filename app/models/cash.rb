# frozen_string_literal: true

class Cash < ApplicationRecord
  has_many :investments, as: :investable

  accepts_nested_attributes_for :investments, allow_destroy: true

  def current_value
    investments.first.buy_value
  end
end
