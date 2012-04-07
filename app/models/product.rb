class Product < ActiveRecord::Base
  belongs_to  :company
  has_many    :fieldings
  has_many    :field_groups, :through => :fieldings, uniq: true

  default_scope order("updated_at DESC")

  validates_presence_of :company_id, :name

  attr_accessor  :field_group_list

  def field_group_name_string
    self.field_groups ? self.field_groups.map{|group| group.label}.join(", ") : ""
  end

  def field_group_name_string=(val)
    if val
      @field_group_list = val.split(",").map {|label| field_group = FieldGroup.find_by_label(label.strip); field_group && field_group.id.to_s}.compact.uniq
    end
  end

  before_save do
    if field_group_list.present?
      return self.field_groups = field_group_list.map { |id| field_group = FieldGroup.find_by_id(id.strip) }.compact.uniq
    else
      self.field_groups = []
    end
  end


  def self.get_field_array
    # every element consist of "name", "label", "name" is column name, "label" is display name
    field_array = [["name","name"], ["company_id","company_id"], ["field_group_name_string","types"]]
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
