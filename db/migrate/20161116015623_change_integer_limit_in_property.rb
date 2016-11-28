class ChangeIntegerLimitInProperty < ActiveRecord::Migration
  def change
  	change_column :properties, :property_id, :integer, limit: 8
  end
end
