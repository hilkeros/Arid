class Post < ActiveRecord::Base
  has_many :comments
  has_permalink :title
  
  validates_presence_of :title
  
  def to_param
    permalink
  end
end
