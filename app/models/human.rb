class Human < ActiveRecord::Base
  validates_presence_of :name 
  validates_presence_of :nid
  validate :test_num
  belongs_to :main_group, :class_name=>Group.name
  has_and_belongs_to_many :group
  attr_accessible :id,:nid, :name, :group_id ,:group , :group_ids
  scope :search ,lambda { |p| where (["name LIKE ?","%#{p}%"])}
  
  
  def test_num
    for i in self.group
      if !i.valid?
        errors.add(:base,"This Human can't be created.Group is full")
        break
      end
    end
  end
  
end