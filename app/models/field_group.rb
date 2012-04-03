class FieldGroup < ActiveRecord::Base
  has_many :fields, order: "position"
  belongs_to :tag
  validates_presence_of :label

  before_save do
    self.name = Pinyin.t(label).downcase.gsub(/[^a-z0-9]/, '_') if name.blank? and label.present?
  end

  def self.with_tags(tag_ids)
    where 'tag_id IS NULL OR tag_id IN (?)', tag_ids
  end
end
