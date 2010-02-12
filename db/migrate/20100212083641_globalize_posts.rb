class GlobalizePosts < ActiveRecord::Migration
  
  class PostTranslation < ActiveRecord::Base;end
  
  def self.up
    @posts = Post.all
    Post.create_translation_table! :title => :string, :body => :text

    @posts.each do |post|
      tpost = PostTranslation.create(:locale => 'en', :post_id => post.id, :title => post[:title], :body => post[:body])
    end
  end

  def self.down
    Post.drop_translation_table!
  end
end