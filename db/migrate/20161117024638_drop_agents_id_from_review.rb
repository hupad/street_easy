class DropAgentsIdFromReview < ActiveRecord::Migration
  def change
  	remove_column :reviews, :agents_id
  end
end
