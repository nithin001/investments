class CreateChitFunds < ActiveRecord::Migration[6.0]
  def change
    create_table :chit_funds do |t|
      t.integer :duration
      t.integer :withdrawn_amount

      t.timestamps
    end
  end
end
