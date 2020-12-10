# frozen_string_literal: true

class CreateCashes < ActiveRecord::Migration[6.0]
  def change
    create_table :cashes, &:timestamps
  end
end
