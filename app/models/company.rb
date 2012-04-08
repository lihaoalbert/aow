class Company < ActiveRecord::Base
  has_many :products

  default_scope order("updated_at DESC")

  def self.find_all_like_by(compNameEN, compNameCN)
    where('compNameEN like ? AND compNameCN like ?', "%#{compNameEN}%", "%#{compNameCN}%")
  end
end
