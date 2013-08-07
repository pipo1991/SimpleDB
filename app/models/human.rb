class Human < ActiveRecord::Base
  # attr_accessible :title, :body
  validates_presence_of :name 
  validates_presence_of :nid
  belongs_to :group
  has_and_belongs_to_many :group
  attr_accessible :id,:nid, :name, :group_id ,:group , :group_ids
  scope :search ,lambda { |p| where (["name LIKE ?","%#{p}%"])}
  
end