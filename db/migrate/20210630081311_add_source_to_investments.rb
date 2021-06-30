# frozen_string_literal: true

class AddSourceToInvestments < ActiveRecord::Migration[6.0]
  def change
    add_column :investments, :source, :string
  end
end
