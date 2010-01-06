class Video < ActiveRecord::Base
  
  has_attached_file :original,
                    :url  => "/assets/media/:id/:basename.:extension",
                    :path => ":rails_root/public/assets/media/:id/:basename.:extension"

end
