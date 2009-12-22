class Post < ActiveRecord::Base
  has_many :comments
  has_permalink :title
  
  validates_presence_of :title
  
  named_scope :public, :conditions => {:press => false}
  
  def to_param
    permalink
  end
end
