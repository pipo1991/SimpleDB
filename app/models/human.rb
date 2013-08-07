class Human < ActiveRecord::Base
  # attr_accessible :title, :body
  validates_presence_of :name 
  validates_presence_of :nid
  validate :group_restrict ,:on => :create
  validate :group_restrict ,:on => :update
  belongs_to :group
  has_and_belongs_to_many :group
  attr_accessible :id,:nid, :name, :group_id ,:group , :group_ids
  scope :search ,lambda { |p| where (["name LIKE ?","%#{p}%"])}
  
  def group_restrict
    if @human.group.count > 3
      errors.add('',"Group can't have more than 4 members.")
    end
  end
end
