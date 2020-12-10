class CreateInvestments < ActiveRecord::Migration[6.0]
  def change
    create_table :investments do |t|
      t.string :name
      t.decimal :initial
      t.decimal :current
      t.belongs_to :member

      t.timestamps
    end
  end
end
