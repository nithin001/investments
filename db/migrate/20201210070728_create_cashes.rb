# frozen_string_literal: true

class CreateCashes < ActiveRecord::Migration[6.0]
  def change
    create_table :cashes do |t|
      t.integer :inr_value, default: 0

      t.timestamps
    end
  end
end
