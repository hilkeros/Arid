class Product < ActiveRecord::Base
  
    has_attached_file :image,
      :styles => { 
          :thumb => [ "100x100>", :jpg ], 
          :medium => [ "450x450>", :jpg ], 
          :large => [ "700x500>", :jpg ] 
      },
      :url  => "/assets/products/:style/:id.:extension",
      :path => ":rails_root/public/assets/products/:style/:id.:extension"
    
end
