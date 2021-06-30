# frozen_string_literal: true

class Investment < ApplicationRecord
  belongs_to :member
  belongs_to :investable, polymorphic: true

  enum status: %i[active matured liquidated]

  scope :by_year, ->(year) { where("(case when extract(month from bought_on) <= 3 then extract(year from (bought_on - interval '1 year')) else extract(year from (bought_on)) end) = ?", year) }

  def self.ransackable_scopes(_auth_object = nil)
    [:by_year]
  end

  def current_value
    investable.current_value
  end

  def financial_year
    return nil unless bought_on
    return bought_on.year - 1 if bought_on.month <= 3

    bought_on.year
  end
end
