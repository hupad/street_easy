class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :address
      t.string :city
      t.integer :property_id
      t.string :state
      t.string :unit
      t.string :zip_code

      t.timestamps null: false
    end
  end
end
