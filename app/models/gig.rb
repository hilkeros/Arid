class Gig < ActiveRecord::Base

    validates_presence_of :date
    validates_presence_of :venue
    validates_presence_of :venue_url
    validates_presence_of :city
    validates_presence_of :country
    
end
