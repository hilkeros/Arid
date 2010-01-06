class Video < ActiveRecord::Base
  
  has_attached_file :original,
                    :url  => "/assets/movies/:id/:basename.:extension",
                    :path => ":rails_root/public/assets/movies/:id/:basename.:extension"

end
