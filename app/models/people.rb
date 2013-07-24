class People < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :group
  has_and_belongs_to_many :group
  attr_accessible :nid, :name, :group_id
  scope :search ,lambda { |p| where (["name LIKE ?","%#{p}%"])}
end
