class CreateMutualFunds < ActiveRecord::Migration[6.0]
  def change
    create_table :mutual_funds do |t|
      t.string :product_code
      t.decimal :units

      t.timestamps
    end
  end
end
