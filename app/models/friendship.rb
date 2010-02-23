class Friendship < ActiveRecord::Base
  
  belongs_to :friend, :class_name => "User"
  
  validates_uniqueness_of :friend_id, :scope => :user_id
  
  def target
    friend
  end
end
