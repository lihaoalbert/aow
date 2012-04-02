class Field < ActiveRecord::Base
  serialize :collection, Array

  belongs_to :field_group

end
