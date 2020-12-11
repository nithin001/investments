class Investment < ApplicationRecord
  belongs_to :member
  belongs_to :investable, polymorphic: true

  enum status: %i[active matured liquidated]

  def current_value
    investable.current_value
  end
end
