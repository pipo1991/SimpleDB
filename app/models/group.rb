class Group < ActiveRecord::Base
  # attr_accessible :title, :body
  has_and_belongs_to_many :human
  attr_accessible :id,:name ,:human ,:human_ids
end
