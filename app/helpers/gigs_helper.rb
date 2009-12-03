module GigsHelper

def gig_ticket_link gig
  if gig.tickets_url?
      link_to "tickets", gig.tickets_url

  else
      link_to "tickets", gig.venue_url
  end
end

end
