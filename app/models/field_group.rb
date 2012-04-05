class FieldGroup < ActiveRecord::Base
  has_many :fields, order: "position"
  has_many :fieldings
  validates_presence_of :label

  before_save do
    self.name = Pinyin.t(label).downcase.gsub(/[^a-z0-9]/, '_') if name.blank? and label.present?
  end

  before_destroy :no_associated_fields

  # Don't allow a field_group to be deleted if it is associated with a Field
  def no_associated_fields
    Field.find_all_by_field_group_id(self).none?
  end

end
