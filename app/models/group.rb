class Group < ActiveRecord::Base
  # attr_accessible :title, :body
  validates_presence_of :name
  validate :group_restrict ,:on => :create
  validate :group_restrict ,:on => :update
  has_and_belongs_to_many :human
  attr_accessible :id,:name ,:human ,:human_ids
  
  def group_restrict
    if @group.human.count > 3
      errors.add('',"Group can't have more than 4 members.")
    end
  end
  
end
