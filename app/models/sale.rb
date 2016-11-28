class Sale < ActiveRecord::Base
  belongs_to :property
  belongs_to :agent
end
