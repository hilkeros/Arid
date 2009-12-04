class AddPermalinkToPostsAndGigs < ActiveRecord::Migration
  def self.up
    add_column :posts, :permalink, :string  
    add_column :gigs, :permalink, :string
    Post.all.each do |post|
      post.send(:create_unique_permalink)
      post.save!
    end
    Gig.all.each do |gig|
      gig.send(:create_unique_permalink)
      gig.save!
    end
  end

  def self.down
    remove_column :gigs, :permalink
    remove_column :posts, :permalink
  end
end
