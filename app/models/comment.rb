class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  belongs_to :photo
  belongs_to :gig
  # belongs_to :video
  
  def target
    post || photo || gig
  end
end
