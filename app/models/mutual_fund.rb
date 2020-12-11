class MutualFund < ApplicationRecord
  has_many :investments, as: :investable

  accepts_nested_attributes_for :investments, allow_destroy: true

  def current_value
    mf_price = Rails.cache.fetch("today_mf_price#{product_code}", expires_in: 24.hours) do
      MutualFundApi.new(product_code).price
    end
    units * mf_price
  end
end
