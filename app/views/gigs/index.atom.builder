atom_feed do |feed|
  feed.title("Arid news feed.")
  feed.updated(@gigs.last.updated_at) if @gigs.present?
  
  for gig in @gigs
    feed.entry(gig) do |entry|
      entry.title(gig.venue)
      entry.content("New Arid show at #{gig.date} at #{gig.venue}\nCheck the websiet for more info.", :type => 'html')
      entry.date(gig.created_at)

      entry.author do |author|
        author.name("Arid")
      end
    end
  end
end