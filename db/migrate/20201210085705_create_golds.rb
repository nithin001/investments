class CreateGolds < ActiveRecord::Migration[6.0]
  def change
    create_table :golds do |t|
      t.decimal :weight

      t.timestamps
    end
  end
end
