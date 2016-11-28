class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :property, index: true, foreign_key: true
      t.references :agent, index: true, foreign_key: true
      t.integer :price

      t.timestamps null: false
    end
  end
end
