class CreateInvestments < ActiveRecord::Migration[6.0]
  def change
    create_table :investments do |t|
      t.text :notes
      t.belongs_to :member
      t.date :bought_on
      t.date :sold_on

      t.decimal :buy_value
      t.decimal :sell_value

      t.integer :status

      t.string :investable_type
      t.string :investable_id
      t.timestamps
    end
  end
end
