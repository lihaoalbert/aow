class Fielding < ActiveRecord::Base
  belongs_to :field_group
  belongs_to :product
end
