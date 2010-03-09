class Photo < ActiveRecord::Base
  
  belongs_to :gig
  belongs_to :user
  has_many :comments
  
  named_scope :arid,  :conditions => {:arid => true}
  named_scope :users, :conditions => {:arid => false}
  
  has_attached_file :image,
    :styles => { 
        :thumb => [ "55x55>", :jpg ], 
        :small => [ "150x150>", :jpg ], 
        :medium => [ "600x400>", :jpg ], 
        :large => [ "700x500>", :jpg ] 
    },
    :url  => "/assets/photos/:style/:id.:extension",
    :path => ":rails_root/public/assets/photos/:style/:id.:extension"
    
    validates_attachment_presence :image
    
    def target
      gig
    end
    
    def title
      name
    end
    
    def message
      "Uploaded a photo '#{self.name}' on http://arid.be"
    end

    def action_links url
      [{:text => "Visit #{self.name}", :href => url}]
    end

    def attachment url
      attachment = Facebooker::Attachment.new
      attachment.name  = name
      attachment.href = url
      attachment.add_image(image.url(:media), url)
      return attachment
    end
    
end
