# frozen_string_literal: true

class Gold < ApplicationRecord
  has_many :investments, as: :investable

  accepts_nested_attributes_for :investments, allow_destroy: true

  def current_value
    gold_price = Rails.cache.fetch('today_gold_price', expires_in: 24.hours) do
      GoldApi.new.price
    end
    weight * gold_price
  end
end
