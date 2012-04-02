class Product < ActiveRecord::Base
  belongs_to :company

  acts_as_taggable

  validates_presence_of :company_id, :name
end
