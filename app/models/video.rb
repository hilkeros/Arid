class Video < ActiveRecord::Base
  
  has_attached_file :original,
                    :url  => "/assets/media/:id/:basename.:extension",
                    :path => ":rails_root/public/assets/media/:id/:basename.:extension"
                    
  named_scope :uploaded, :conditions => "url IS NULL"
  named_scope :links, :conditions => "url IS NOT NULL"
  
  def youtube_id
    url.to_s[/watch\?v=([^&]+)/,1]
  end
end