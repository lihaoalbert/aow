class Company < ActiveRecord::Base
  has_many :products

  default_scope order("updated_at DESC")
end
