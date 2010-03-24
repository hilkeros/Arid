class Comment < ActiveRecord::Base  
  belongs_to :post
  belongs_to :user
  belongs_to :photo
  belongs_to :gig
  # belongs_to :video
  
  def target
    post || photo || gig
  end
  
  def message
    "Made a comment on '#{self.target.title.titleize}' on http://arid.be: #{body}"
  end
  
  def action_links url
    [{:text => "Visit #{self.target.title.titleize}", :href => url}]
  end
  
  def attachment url
    return false if photo.blank?
    attachment = Facebooker::Attachment.new
    attachment.name  = photo.name
    attachment.href = url
    attachment.add_image(photo.image.url(:media), url)
    return attachment
  end
end
