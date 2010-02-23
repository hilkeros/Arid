class Gig < ActiveRecord::Base

    validates_presence_of :date
    validates_presence_of :venue
    validates_presence_of :venue_url
    validates_presence_of :city
    validates_presence_of :country

    has_many :comments
    has_many :photos
    has_many :videos
    named_scope :futur, :conditions => ["date > ?", Time.now.midnight]
    named_scope :past, :conditions => ["date < ?", Time.now.midnight]

    acts_as_url :venue_url
    
    has_permalink [:date, :venue]
    
    def to_param
      permalink
    end

end
