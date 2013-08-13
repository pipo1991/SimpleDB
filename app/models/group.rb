class Group < ActiveRecord::Base
  validates_presence_of :name
  has_and_belongs_to_many :human
  attr_accessible :id,:name ,:human ,:human_ids
  validate :group_size
  
  def group_size
    if self.human.count >4
      errors.add(:base,"This group have more than 4 members.")
    end
  end
end
