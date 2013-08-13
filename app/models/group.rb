class Group < ActiveRecord::Base
  validates_presence_of :name
  has_and_belongs_to_many :human
  attr_accessible :id,:name ,:human ,:human_ids
end
