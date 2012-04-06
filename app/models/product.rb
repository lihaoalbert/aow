class Product < ActiveRecord::Base
  belongs_to  :company
  has_many    :fieldings
  has_many    :field_groups, :through => :fieldings, uniq: true

  validates_presence_of :company_id, :name

  attr_accessor   :field_group_list

  before_save do
    if field_group_list.present?
      self.field_groups = field_group_list.map { |id| field_group = FieldGroup.find_by_id(id.strip) }.compact.uniq
    else
      self.field_groups = []
    end
  end

end
