class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.string :brokerage
      t.string :first_name
      t.string :last_name
      t.string :middle_initial

      t.timestamps null: false
    end
  end
end
