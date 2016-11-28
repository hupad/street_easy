class Agent < ActiveRecord::Base
	has_many :sales
	has_many :reviews
end
