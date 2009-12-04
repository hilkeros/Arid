atom_feed do |feed|
  feed.title("Arid news feed.")
  feed.updated(@posts.last.updated_at)

  for post in @posts
    feed.entry(post) do |entry|
      entry.title(post.title)
      entry.content(post.body, :type => 'html')
      entry.date(post.created_at)

      entry.author do |author|
        author.name("Arid")
      end
    end
  end
end