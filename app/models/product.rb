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

  def self.get_field_array
    # every element consist of "name", "label", "name" is column name, "label" is display name
    field_array = [["id","id"], ["company_id","company_id"], ["name","name"]]
    FieldGroup.all.each do |group|
      if group.fields && group.fields.present?
        group.fields.each do |field|
          field_array << [field.name, field.label]
        end
      end
    end
    field_array
  end

end
