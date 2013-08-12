class Human < ActiveRecord::Base
  # attr_accessible :title, :body
  validates_presence_of :name 
  validates_presence_of :nid
  validate :test_num
  belongs_to :main_group, :class_name=>Group.name
  has_and_belongs_to_many :group
  attr_accessible :id,:nid, :name, :group_id ,:group , :group_ids
  scope :search ,lambda { |p| where (["name LIKE ?","%#{p}%"])}
  
  
  def test_num
    for i in self.group.each
      if i.human.count > 4
        errors.add(:base,"This is group have more than 4 members.")
        break
      end
    end
  end
  
end