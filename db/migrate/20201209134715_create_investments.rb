class CreateInvestments < ActiveRecord::Migration[6.0]
  def change
    create_table :investments do |t|
      t.text :notes
      t.belongs_to :member
      t.date :bought_on
      t.integer :status

      t.string :investable_type
      t.string :investable_id
      t.timestamps
    end
  end
end
