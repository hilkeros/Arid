class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  # belongs_to :photo
  # belongs_to :video
  
  def target
    post
  end
end
