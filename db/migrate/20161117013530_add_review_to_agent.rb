class AddReviewToAgent < ActiveRecord::Migration
  def change
  	add_reference :reviews, :agent, index: true, foreign_key: true
  end
end
