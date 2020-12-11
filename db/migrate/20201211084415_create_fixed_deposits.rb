class CreateFixedDeposits < ActiveRecord::Migration[6.0]
  def change
    create_table :fixed_deposits do |t|
      t.decimal :maturity_amount

      t.timestamps
    end
  end
end
