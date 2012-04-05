class Product < ActiveRecord::Base
  belongs_to  :company
  has_many    :fieldings
  has_many    :field_groups, :through => :fieldings, uniq: true

  validates_presence_of :company_id, :name

  attr_accessor   :field_group_list

  before_save do
    p field_group_list.inspect
    self.field_groups = field_group_list.map { |id| field_group = FieldGroup.find_by_id(id.strip) }.compact.uniq if field_group_list.present?
  end

end
